public with sharing class SOLIDLiskovSubClass2 implements SOLIDLiskov {
    
    // Override the processPayment method
    // public override void processPayment(Decimal amount) {
    //     System.debug('Processing PayPal payment of ' + amount);
    //     // Add PayPal-specific processing logic here
    // }


// This violates LSP by throwing an exception unexpectedly
//If one of the subclasses does something that violates the contract of the base class, you would break LSP. 
//For example, if the PayPalPayment class throws an unexpected exception or modifies input/output in a way that is incompatible with PaymentProcessor, the program would fail when substituting the subclass.
//  public override void processPayment(Decimal amount) {
//     throw new PaymentException('PayPal payment failed unexpectedly!');
// }


    /////End GPT Example//////
    // public void createTaskOpp(ID what, Opportunity opp){
    //     System.debug('calling Opp');
    // }

    // public void createTaskContact(Id whatId, Contact cont){
    //     throw new TaskException('No task could be created on this object');

    // }

    // public class TaskException extends Exception {}


      ///// finally, the correct implementation 
      public void createTask(SObject record){
        System.debug('creating from the second');
    }



}