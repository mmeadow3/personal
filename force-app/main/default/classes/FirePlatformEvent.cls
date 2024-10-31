/*
*********************************************************
Apex Class Name    : FirePlatformEvent
Created Date       : 12/20/23
@description       : Class to create a Platform Event from a LWC
@author            : Mike Meadows |  mmeadow33@gmail.com
Modification Log:
Ver   Date         Author                               Modification
1.0   12/20/23   Mike Meadows                           Initial Version
1.1   12/21/23   Mike Meadows                           Created a Commment Framework
*********************************************************
*/
public with sharing class FirePlatformEvent {
       /* *********************************************************
        @Method Name    : fireEvent
        @author         : Mike Meadows
        @description    : only method, used to fire Platform Event
        @param          : {String} message
        @return         : void
    ********************************************************
    */ 
    @AuraEnabled
    public static void fireEvent(String message){
        Test_Platty_Event__e event = new Test_Platty_Event__e();
        event.Little_Message__c = message;
        EventBus.publish(event);
    }
}