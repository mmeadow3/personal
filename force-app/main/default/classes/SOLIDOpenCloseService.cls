public with sharing class SOLIDOpenCloseService {
   // This method accepts any strategy that implements DiscountStrategy

   /// Original Example from ChatGPT, good but we can do better

    //    public Decimal applyDiscount(SOLIDOpenCloseInterface discountStrategy, Decimal price) {
    //         return discountStrategy.calculateDiscount(price);
    //     }   



    ///////////////////////////////////////////////
    ///Coding with the force Example

    ///// What GPT didnt do is make a map that cleans up the code calling from this service class
    //// These dont have to be static normally but usually they are

    public static Map<String, Type> classMap = new Map<String, Type> {
        'Contact' => SOLIDOpenCloseFlatPrice.class,
        'Lead' => SOLIDOpenClosePercentagePrice.class
        /// to keep with OpenClosed Principle,we just create a new class and add it here for any new implmentations
    };

    public static List<SObject> getRecords(String objectType){
        SOLIDOpenCloseInterface discountStrategy = (SOLIDOpenCloseInterface)classMap.get(objectType).newInstance();
        return discountStrategy.getRecords();
    }
}