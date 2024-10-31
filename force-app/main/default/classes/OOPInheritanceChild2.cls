public class OOPInheritanceChild2 extends OOPInheritance{

    public Integer recurrenceMonths { get; set; }
    public Decimal discount { get; set; }


    public OOPInheritanceChild2(Integer amount, string name, Integer recurrenceMonths, Decimal discount) {
        super(amount, name);
        this.recurrenceMonths = recurrenceMonths;
        this.discount = discount;
    }

      // Override the calculateTotal method to apply a discount
      public override Decimal calculateTotal() {
        Decimal total = super.calculateTotal(); // Call base method if needed
        System.debug('total from the override before applying additional logic: ' + total);
        // Apply discount logic specific to recurring invoices
        Decimal discountAmount = total * (discount / 100);
        System.debug('After applying the logic: ' +  Integer.valueOf(total - discountAmount));
        return total - discountAmount;
    }
}