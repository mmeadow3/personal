public class OOPAbstractionChild1 extends OOPAbstraction{

        // Implementing the abstract method from PaymentProcessor
        public override void processPayment(Decimal amount) {
            // In a real-world system, this would interact with a credit card API
            System.debug('Child 1 amount :  ' + amount);
            // Logic to integrate with payment gateway (e.g., Stripe, Authorize.net)
        }
}