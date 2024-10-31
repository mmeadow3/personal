public with sharing class OOPpolymorphismChild2 extends OOPpolymorphism {
       //// since this extends the virtual class, this method must be used
        //// this has to be ba an override method or else it will not compile

       public override void sendNotification(String message) {

        System.debug('Sending From Child class 2 : ' + message);

    }
}