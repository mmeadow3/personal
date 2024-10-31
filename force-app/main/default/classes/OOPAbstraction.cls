public abstract class OOPAbstraction {
    ///Abstraction is a key principle in OOP, where you define the general structure of a class but leave the implementation details to be provided by derived classes.
    
    //When we talk about abstract classes we are defining characteristics of an object type; specifying what an object is.

    //When we talk about an interface and define capabilities that we promise to provide, we are talking about establishing a contract about what the object can do.


    // Abstract method to be implemented by all concrete payment processors
    public abstract void processPayment(Decimal amount);

    // Common method to print the payment receipt, reused by all payment types
    public void printReceipt(Decimal amount) {
        System.debug('Payment of ' + amount + ' has been processed.');
    }

}