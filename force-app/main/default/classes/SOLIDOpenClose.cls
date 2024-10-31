public with sharing class SOLIDOpenClose {

    //// Example of what not to do
    ////  Every time a new discount type is introduced, we modify the existing class:


    // This approach is problematic because:

    // Every time we add a new discount type, we have to modify the existing code.
    // The logic is tightly coupled within a single class.
    // If new requirements arise (e.g., loyalty discounts, seasonal discounts), the class becomes more complex, leading to errors and higher maintenance costs.

    //The solution is to use an interface - SOLIDOpenCloseInterface
    // And make the classes implement the interface - SOLIDOpenClosePercentagePrice, SOLIDOpenCloseFlatPrice
    // only doing those two classes because we get it, we dont need all examples

    ///And now instead of this class, we make a Service class
    ///now we can add different discount strategies using polymorphism. You don't need to modify this (new) class (SOLIDOpenCloseService) whenever you add a new discount type—just create a new class that implements the Interface

    public Decimal calculateDiscount(String discountType, Decimal price) {
        if (discountType == 'Percentage') {
            return price * 0.10; // 10% discount
        } else if (discountType == 'Flat') {
            return 20.00; // $20 flat discount
        } else if (discountType == 'Holiday') {
            return price * 0.15; // 15% holiday discount
        } else {
            return 0.00;
        }
    }

    //How to run this bad boy:
    // SOLIDOpenCloseService discountService = new SOLIDOpenCloseService();
    // Decimal originalPrice = 100.00;


    // SOLIDOpenCloseInterface percentageDiscount = new SOLIDOpenCloseFlatPrice(10); // 10% off
    // Decimal discountedPrice1 = discountService.applyDiscount(percentageDiscount, originalPrice);
    // System.debug('Price after 10% discount: ' + discountedPrice1);
}