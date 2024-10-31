public with sharing class ContactLWClogic implements IdynamicLWC{ 
    /////both methods must be in here since it is implementing the Interface 

    ///// Aside from calling this normally - 
    ////// ContactLWClogic clwc = new ContactLWClogic();
    ////// we can now TypeCast it bc of the Interface
    //////ContactLWClogic clwc = new ContactLWClogic();
    ////// IdynamicLWC i = (IdynamicLWC)clwc;
    public void sayHello(){
        System.debug('Hello from the Contact Side of Things');
    }
    
    public void sayGoodbye(){
        System.debug('GoodBye from the Contact Side of Things');

    } 
}