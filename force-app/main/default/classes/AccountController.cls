public with sharing class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccList(){
        return [SELECT Id, Name, Phone, Rating FROM Account];
    }
}