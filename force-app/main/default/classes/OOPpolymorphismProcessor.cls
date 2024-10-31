public with sharing class OOPpolymorphismProcessor {
    public static void demoPolymorphism() {

        OOPpolymorphism child1 = new OOPpolymorphismChild1();
        OOPpolymorphism child2 = new OOPpolymorphismChild2();

        // Create the processor
        ///// this is the class that actually handles the polymorphism 
        OOPNotificationProcessor processor = new OOPNotificationProcessor();

        processor.processNotification(child1, 'Hello via Child 1, this is the text sent from the Processor!');
        processor.processNotification(child2, 'Hello via Child 2, this is the text sent from the Processor!');
    }

    ////And to call this bad boy:   
    /////OOPpolymorphismProcessor.demoPolymorphism();

}