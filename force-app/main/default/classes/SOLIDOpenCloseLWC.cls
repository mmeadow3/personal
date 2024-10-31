public with sharing class SOLIDOpenCloseLWC {
   ////// This is how we would call our Apex class from the LWC

   @AuraEnabled
   //// method must be static to call from LWc 
   ///This is because LWC operates in a stateless environment when interacting with the server, so it requires methods that don't depend on instance-specific data.

   //This could be used with multiple object since it takes in a generic ObjectApiName
   public static List<Object> getDataForUI(String objectApiName){
        List<SObject> listofSObjects = SOLIDOpenCloseService.getRecords(objectApiName);
        System.debug('calling from the the LWC-Apex class');
        /// in the example, Coding with the force calls another method from the SOLIDOpenCloseService class and passes in listofSObjects (from above)
        return listofSObjects;
   }
}