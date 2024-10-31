/*
*********************************************************
Apex Class Name    : Account Trigger
Created Date       : 12/28/23
@description       : Trigger For Account Object
@author            : Mike Meadows |  mmeadow33@gmail.com
Modification Log:
Ver   Date         Author                               Modification
1.0   12/28/23   Mike Meadows                           Initial Version
1.1   01/03/24   Mike Meadows                           Added all possible contexts in Arguments 
*********************************************************
*/

trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
        new AccountTriggerHandler().run();
  }