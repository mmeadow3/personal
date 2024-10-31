/*
*********************************************************
Apex Class Name    : AccountTriggerHandler
Created Date       : 12/28/23
@description       : Trigger Handler For Account Object
@author            : Mike Meadows |  mmeadow33@gmail.com
Modification Log:
Ver   Date         Author                               Modification
1.0   12/28/23   Mike Meadows                           Initial Version
*********************************************************
*/
public class AccountTriggerHandler extends TriggerHandler {

    private Map<Id, Account> newAccMap;
  
    public AccountTriggerHandler() {
      this.newAccMap = (Map<Id, Account>) Trigger.newMap;
    }
    
    public override void beforeUpdate() {
      System.debug('AHHHHHHHHHHHHH');
      ////// from here we should be calling a class - NO LOGIC IN HERE
    }

    public override void beforeInsert() {
        System.debug('INSERTTTTTT');
              ////// from here we should be calling a class - NO LOGIC IN HERE

      }
  
  }