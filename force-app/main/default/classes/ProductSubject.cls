public with sharing class ProductSubject implements ISubject{
    String id;

    public ProductSubject(String id){
        this.id = id;
    }

    public void subscribe(Product_Notification__c observer){
        System.debug('called subscribe');
        //// this is where the Subject Class (this one) is calling its one to many observers
        observer.Product_Catalog__c = this.id;
        observer.Subscribe__c = true;
        if (Schema.sObjectType.Product_Notification__c.isCreateable()) {
            insert observer;
        }
    }

    public void unsubscribe(Product_Notification__c observer){

        System.debug('called unsubscribe');
        // observer.Product_Catalog__c = this.id;
        // observer.Subscribe__c = false;
        // if (Schema.sObjectType.Product_Notification__c.isCreateable()) {
        //     insert observer;
        // }
    }

    public void notifyObserver(){

        System.debug('Notify Calling');
        IObserver observer = new ProductObserver(this.id);
        observer.notifity();
    }
}