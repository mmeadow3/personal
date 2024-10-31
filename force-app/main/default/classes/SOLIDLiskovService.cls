public with sharing class SOLIDLiskovService {
    //This is where LSP comes into play—our service doesn’t care which specific subclass is being passed; it will process payments correctly for any subclass that extends PaymentProcessor.
    // Method that accepts any type of PaymentProcessor
    // public static void processAnyPayment(SOLIDLiskov paymentProcessor, Decimal amount) {
    //     paymentProcessor.processPayment(amount);
    // }

    /// to run this bad boi: 
    // SOLIDLiskovService paymentService = new SOLIDLiskovService();

    // // // Processing a credit card payment
    // SOLIDLiskovSubClass1 creditCardPayment = new SOLIDLiskovSubClass1();
    // SOLIDLiskovService.processAnyPayment(creditCardPayment, 100.00); // Works fine

    // // Processing a PayPal payment
    // SOLIDLiskovSubClass2 paypalPayment = new SOLIDLiskovSubClass2();
    // SOLIDLiskovService.processAnyPayment(paypalPayment, 200.00); // Works fine

    //Notes:
    //You can substitute the CreditCardPayment and PayPalPayment classes in place of the PaymentProcessor base class. Both work without causing any errors or unexpected behavior.
    //The processAnyPayment method in PaymentService can take any subclass of PaymentProcessor and process the payment, showcasing polymorphism and adherence to LSP.
    //Even though CreditCardPayment and PayPalPayment override the processPayment method, they do not change the expected behavior from the perspective of PaymentService.
    //By following LSP, your system remains flexible and extensible, allowing new payment types to be added easily without modifying the core service logic


    // static Map<SObjectType, Type> processorMap = new Map<SObjectType, Type>{
    //     Opportunity.SObjectType => SOLIDLiskovSubClass1.class,
    //     Contact.SObjectType => SOLIDLiskovSubClass2.class
    // };

    // public static void createTak(SObject record){
    //     SOLIDLiskov solidL = (SOLIDLiskov)processorMap.get(record.getSObjectType()).newInstance();
    //     solidL.createTaskOpp(null, null);
    //     solidL.createTaskContact(null, null);
    // }


    ///// For the example lets not use actual Objects and istead just String Values
    // static Map<String, Type> processorMap = new Map<String, Type>{
    //     'Opportunity' => SOLIDLiskovSubClass1.class,
    //     'Contact' => SOLIDLiskovSubClass2.class
    // };

    // public static void createTask(String record){
    //     SOLIDLiskov solidL = (SOLIDLiskov)processorMap.get(record).newInstance();
    //     solidL.createTaskOpp(null, null);
    //     solidL.createTaskContact(null, null);
    // }


    //// Finally with the updated interface that allows the implementations to all work
    static Map<String, Type> processorMap = new Map<String, Type>{
        'Opportunity' => SOLIDLiskovSubClass1.class,
        'Contact' => SOLIDLiskovSubClass2.class
    };

      public static void createTask(String record){
        SOLIDLiskov solidL = (SOLIDLiskov)processorMap.get(record).newInstance();
        solidl.createTask(null);
    }

 ////// call this bad boy: 
 //SOLIDLiskovService.createTask('Opportunity');  //// or SOLIDLiskovService.createTask('Contact');
 //// we have to make the Interface to work for all of its implementations 
}