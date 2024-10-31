public with sharing class OOPAbstractionService {

    public void executePayment(String paymentMethod, Decimal amount) {
        OOPAbstraction processor;

        // Determine which payment processor to use based on the input
        if (paymentMethod == 'CreditCard') {
            processor = new OOPAbstractionChild1();
        } else if (paymentMethod == 'PayPal') {
            processor = new OOPAbstractionChild2();
        } else {
            throw new IllegalArgumentException('Invalid payment method.');
        }

        // Process the payment
        processor.processPayment(amount);
        
        // Print receipt (common behavior)
        processor.printReceipt(amount);
    }

    ///call this bad boy:
    
    // OOPAbstractionService paymentService = new OOPAbstractionService();
    // // Calling the executePayment method
    // String paymentMethod = 'CreditCard'; // Could be 'PayPal', 'BankTransfer', etc.
    // Decimal amount = 150.00;

    // paymentService.executePayment(paymentMethod, amount);
}