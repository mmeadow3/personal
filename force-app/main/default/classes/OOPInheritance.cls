public virtual class OOPInheritance {

    public Integer amount;
    public String name;

    public OOPInheritance(Integer amount, String name) {
        this.amount  = amount;
        this.name = name;
    }

    public virtual Decimal calculateTotal() {
        System.debug('Calling this on Parent Only: ' + amount);
        return amount;
    }

    public void printInvoiceDetails() {
        System.debug('Amount from the Parent: ' + amount + ', Name: ' + name);
    }
}