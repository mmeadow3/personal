public with sharing class DiscountFactory {

    public static IDiscount getDiscount(string customerTier){
        Discounts__mdt discountMeta = [Select Class_To_Instantiate__c, Discount__c From Discounts__mdt Where Customer_Tier__c = :customerTier WITH SECURITY_ENFORCED];
        //// Type class allows us to instantiate a class by its name
        Type t = Type.forName(discountMeta.Class_To_Instantiate__c); //// so calling the Class from the metadata field 
        IDiscount discount = (IDiscount)t.newInstance();  /// instantiate the Type t class, has to be Type-cast
        return discount;
    }
}