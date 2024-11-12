public with sharing class CallAWSLambda {
  public static String callLambdaFunction(String jsonData) {
    // Endpoint of your API Gateway that triggers the Lambda function
    // List<API__mdt> metadataRecords = [
    //   SELECT DeveloperName, API_Endpoint__c
    //   FROM API__mdt
    // ];
    // String endpointUrl = metadataRecords[0].API_Endpoint__c;

    ///// now we used named credentials
    // Works with AWS Signature Version 4 and IAM (built-in) in the AWS console
    //// had to make new User in AWS for the role, added their credentials to the Principals section of the Named Credential
    ///
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    // request.setEndpoint(endpointUrl);
    request.setEndpoint('callout:AWS_API_Gateway/lambda'); /// Got this working with named credentials - the part that wasnt working was the Service name had to be =  execute-api not API Gateway
    request.setMethod('GET');

    System.debug(request);

    // Set the request body (JSON format)
    //request.setBody(jsonData);

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
}
