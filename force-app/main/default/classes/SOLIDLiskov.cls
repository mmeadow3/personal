public interface SOLIDLiskov {
/// The virtual class was the old example
//public with sharing virtual class SOLIDLiskov {
  
  //This class defines the general contract (method) that all payment processors must implement.


    // Virtual method for processing payment
    // public virtual void processPayment(Decimal amount) {
    //     System.debug('Processing payment of ' + amount);
    // }

    //// End ChatGPT Example//////
    //////Start Coding with the Force Example //////

    //void createTaskOpp(ID what, Opportunity opp);
    //void createTaskContact(Id whatId, Contact cont);

    //// This way above doesnt allow all of its implementations to run without an error since the Task cant be created the same way from Opps and Contacts

    ///// so now we just make a generic one 
    void createTask(SObject record);

}