public class OOPInheritanceChild extends OOPInheritance{

    public OOPInheritanceChild(Integer amount, String name) {
        super(amount, name);
    }


    //////////Can call calculateTotal without having the method in this clas
    // OOPInheritanceChild oop  = new OOPInheritanceChild(50, 'Mike');
    // oop.calculateTotal(); /// this will work 

    /// also can call the non-virutal method
    // OOPInheritanceChild oop  = new OOPInheritanceChild(50, 'Mike');
    // oop.printInvoiceDetails();



    // public override Decimal calculateTotal() {
    //     return amount;
    // }

}