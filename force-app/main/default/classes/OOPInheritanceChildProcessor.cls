public with sharing class OOPInheritanceChildProcessor {

    /////     Polymorphism: When calling calculateTotal() on an Invoice object, 
    /////     Apex automatically calls the correct method based on the actual object type 
    /////     (whether it's StandardInvoice or RecurringInvoice/OOPInheritanceChild2).  

    public void processInvoices() {
        // Create a standard invoice
        ////create it from the OG OOPInheritance
        /// the only difference is the class after the new keyowrd
        OOPInheritance oop1 = new OOPInheritanceChild(1000, 'Mike Invoice 1');
        oop1.printInvoiceDetails();
        System.debug('Standard Invoice Total: ' + oop1.calculateTotal());
        
        // Create a recurring invoice
        ////create it from the OG OOPInheritance
        OOPInheritance oop2 = new OOPInheritanceChild2(5000, 'Mike Invoice 2', 12, 10); // 10% discount
        oop2.printInvoiceDetails();
        System.debug('Recurring Invoice Total: ' + oop2.calculateTotal());
    }
}