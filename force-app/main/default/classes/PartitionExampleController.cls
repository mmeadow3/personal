public with sharing class PartitionExampleController {
  @AuraEnabled
  public static void storeDataController(){
    ///// grab a random Contact record and Store it in the Platform Cache
    Contact con = [Select Id, FirstName, LastName from Contact WHERE Id = '003Hn00002diACBIA2' LIMIT 1];
    //// build a map - key can be named anything
    Cache.Session.put('ContactFound', con);
    Cache.Session.put('local.SecondPartition.ContactFound', con);
    ///// Cache.Session.put('local.SecondPartition.ContactFound', con); ---- when not using the default Partition this is the way to store


     ///mostly used to store alot of different types on data
   // Cache.SessionPartition sessionPartition = Cache.Session.getPartition('local.SecondPartititon');
    //sessionPartition.put('ContactFound', con);
    ////// Session is just for that user for that time
    ///// org is for everyone in the entire org - be aware of this 
  }


  @AuraEnabled
  public static Contact retrieveDataCacheController(){
    //// if (Cache.Session.contains) --- see if it exists before returning 
    return (Contact)Cache.Session.get('ContactFound'); ///// get value from the map
  }


  ///// this is to bench mark against w/o using the Cache
  @AuraEnabled
  public static Contact retieveDataSOQL(){
    return [Select Id, FirstName, LastName from Contact WHERE Id = '003Hn00002diACBIA2' LIMIT 1];
  }
}