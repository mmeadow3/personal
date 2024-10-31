public with sharing class SOLIDOpenCloseFlatPrice implements SOLIDOpenCloseInterface{
    //Broken out from SOLIDOpenClose

    // private Decimal flatAmount;

    // // Constructor to set the flat discount (e.g., $20)
    // //// This is this owns class logic to do some logic,  this is where it will be different from other classes
    // public SOLIDOpenCloseFlatPrice(Decimal flatAmount) {
    //     this.flatAmount = flatAmount;
    // }

    // // Implement the method to calculate a flat discount
    // public Decimal calculateDiscount(Decimal price) {
    //     return price - flatAmount;
    // }


    //////////////////////////////////////////////////////////////////
    ////Coding with the force implementation 
    public List<SObject> getRecords(){
        List<Contact> con = [Select Id, Name from Contact WITH SECURITY_ENFORCED];
        System.debug('returned a Contact : ' + con[0].Name);
        return con;
    }


    // public List<Object> wrapRecordsForUIList(List<SObject> sObjectRecords){


    // }
}