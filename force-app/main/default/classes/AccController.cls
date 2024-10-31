public with sharing class AccController {

    @AuraEnabled(cacheable=true)
    public static List<account> getAccList(){
        return [Select Id, Name, Phone From Account Limit 10];
    }

    @AuraEnabled
    public static List<Account> findAccountList(String keyword){
        String key = '%'+ keyword +'%';
        return [Select Id, Name from Account where Name like:key Limit 10];
    }
}