public with sharing class SOLIDOpenClosePercentagePrice implements SOLIDOpenCloseInterface{
        //Broken out from SOLIDOpenClose
        // private Decimal percentage;

        // // Constructor to set the percentage (e.g., 10%)
        // //// This is this owns class logic to do some logic,  this is where it will be different from other classes
        // public SOLIDOpenClosePercentagePrice(Decimal percentage) {
        //     this.percentage = percentage;
        // }
    
        // // Implement the method to calculate percentage-based discount
        // public Decimal calculateDiscount(Decimal price) {
        //     return price * (percentage / 100);
        // }


    //////////////////////////////////////////////////////////////////
    ////Coding with the force implementation 
    public List<SObject> getRecords(){
        List<Lead> lead = [Select Id, Name from Lead WITH SECURITY_ENFORCED];
        System.debug('returned a Lead : ' + lead[0].Name);
        return lead;
    }
}