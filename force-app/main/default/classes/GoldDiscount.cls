public with sharing class GoldDiscount implements IDiscount{
    private Decimal discount;
    
    public GoldDiscount(){
        this.discount = [Select Discount__c From Discounts__mdt Where Customer_Tier__c = 'Gold' WITH SECURITY_ENFORCED].Discount__c;
        System.debug(this.discount);
    }

    public Decimal calculateDiscount(Decimal oppAmount) {
        System.debug( this.discount);
        return oppAmount - (oppAmount * this.discount);
    }

}