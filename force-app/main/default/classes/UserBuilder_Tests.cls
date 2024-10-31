@isTest

private class UserBuilder_Tests {
   @IsTest
   static void itShouldUpdate() {
    ////// good example bc building users usually takes a while
    User user = new UserDirector().build(new UserBuilder.Admin());
    
    System.runAs(user) {
        ////// System.assert (that a user can update a field only an admin can)
        //// didnt build out this logic 
    }
   }

   
   static void itShouldNotUpdate() {
    
    Test.startTest();
    
    Test.stopTest();
   }
}