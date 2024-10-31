public with sharing class AccountLWClogic implements IdynamicLWC{ 
        /////both methods must be in here since it is implementing the Interface 
        public void sayHello(){
            System.debug('Hello from the Account Side of Things');
        }
        
        public void sayGoodbye(){
            System.debug('GoodBye from the Account Side of Things');
    
        } 
}