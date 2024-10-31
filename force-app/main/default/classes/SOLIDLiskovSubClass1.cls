public with sharing class SOLIDLiskovSubClass1 implements SOLIDLiskov {
    /// old example extended it, this new one implements the interface
//public with sharing class SOLIDLiskovSubClass1 extends SOLIDLiskov {
 
    // Override the processPayment method
//  public override void processPayment(Decimal amount) {
//     System.debug('Processing credit card payment of ' + amount);
//     // Add credit card-specific processing logic here
// }

// This violates LSP by throwing an exception unexpectedly
//If one of the subclasses does something that violates the contract of the base class, you would break LSP. 
//For example, if the PayPalPayment class throws an unexpected exception or modifies input/output in a way that is incompatible with PaymentProcessor, the program would fail when substituting the subclass.
//  public override void processPayment(Decimal amount) {
//     throw new PaymentException('PayPal payment failed unexpectedly!');
// }

    /////End GPT Example//////

    /// first example that does not work because its too open to violation
    // public void createTask(Id whatId, SObject sobj){
    //     System.debug('This is the new task method');
    // }
    // public void createTaskOpp(ID what, Opportunity opp){
    //     throw new TaskException('No task could be created');
    // }

    // public void createTaskContact(Id whatId, Contact cont){
    //     System.debug('Calling from the Opp');
    // }

    // public class TaskException extends Exception {}


    ///// finally, the correct implementation 
    public void createTask(SObject record){
        System.debug('creating from the first');
    }

}