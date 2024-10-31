public with sharing class ProductObserver implements IObserver {
    String id;
    public ProductObserver(String id) {
        this.id = id;
    }


    public void notifity(){
        System.debug('notify from the ProductObserver');

        ///// try to avoid inline queries like this, can use the builder pattern to escape this
        List<Product_Notification__c> observers = [
            SELECT Id, Email_Address__c
            FROM Product_Notification__c
            WHERE Product_Catalog__c = :this.id
            AND Subscribe__c = TRUE
            WITH SECURITY_ENFORCED
        ];

        for (Product_Notification__c observer : observers) {
            System.debug('pretend this is sending an email to : ' + observer.Email_Address__c);
        }
    }

}