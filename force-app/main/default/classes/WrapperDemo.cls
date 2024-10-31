public with sharing class WrapperDemo {

    @AuraEnabled(cacheable = true)
    public static List<AccountContactWrapperClass> getAccountsWithWrapper(){
        List<AccountContactWrapperClass> listAccountWrapper = new List<AccountContactWrapperClass>();
        for (Account acc : [Select Id, Name, Type, BillingStreet, BillingCity, (Select Id from Contacts) From Account where Name != null LIMIT 10]){
            listAccountWrapper.add(new AccountContactWrapperClass(acc, acc.Contacts.size()));
        }
        return listAccountWrapper;
    }
    
    public class AccountContactWrapperClass{
        @AuraEnabled
        public Account acc;
        @AuraEnabled
        public Integer totalContacts;
        @AuraEnabled
        public String billingAddress;
        @AuraEnabled
        public String type;
        @AuraEnabled
        public String accountName;
        @AuraEnabled
        public String accountLink;

        public AccountContactWrapperClass(Account acc, Integer totalContacts){
            this.acc = acc;
            this.totalContacts = totalContacts;
            this.billingAddress = acc.BillingStreet + ', ' + acc.BillingCity;
            this.type = acc.Type;
            this.accountName = acc.Name;
            this.accountLink = '/' + acc.Id;
        }
    }

}