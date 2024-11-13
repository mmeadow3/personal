public with sharing class CallAWSLambda {
  public static String callLambdaFunction(String name, Integer rev) {
    // Endpoint of your API Gateway that triggers the Lambda function
    // List<API__mdt> metadataRecords = [
    //   SELECT DeveloperName, API_Endpoint__c
    //   FROM API__mdt
    // ];
    // String endpointUrl = metadataRecords[0].API_Endpoint__c;

    ///// now we used named credentials
    // Works with AWS Signature Version 4 and IAM (built-in) in the AWS console
    //// had to make new User in AWS for the role, added their credentials to the Principals section of the Named Credential
    ///  Also had to add the Externl Credential to my Profile in Salesforce after the Pricipal was created
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    // request.setEndpoint(endpointUrl);
    // request.setEndpoint('callout:AWS_API_Gateway/lambda'); /// Got this working with named credentials - the part that wasnt working was the Service name had to be =  execute-api not API Gateway
    request.setEndpoint('callout:AWS_REST_API/Default/SalesforceCreate'); /// -trying a REST Api instead of HTTP Api

    //request.setMethod('GET');
    request.setMethod('POST');

    // Set the request body (JSON format)
    AccountPayload payload = new AccountPayload();
    payload.name = name;
    payload.annualRevenue = rev;
    payload.numberOfEmployees = 100;

    String jsonPayload = JSON.serialize(payload);

    // Set the request body and headers
    request.setBody(jsonPayload);
    request.setHeader('Content-Type', 'application/json');

    // Send the request
    HttpResponse response = http.send(request);

    // Handle the response
    if (response.getStatusCode() == 200) {
      System.debug(response.getBody());
      return response.getBody(); // Return the response body if the call was successful
    } else {
      System.debug('Error: ' + response.getStatus());
      System.debug('Response: ' + response.getBody());
      return null;
    }
  }

  public class AccountPayload {
    public String name;
    public Integer annualRevenue;
    public Integer numberOfEmployees;
  }
}
