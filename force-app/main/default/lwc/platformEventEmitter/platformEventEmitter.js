/*
Created Date       : 12/20/23
@description       : LWC to fire a Platform event
@author            : Mike Meadows | mmeadow33@gmail.com
Modification Log:
    Ver   Date         Author                               Modification
    1.0   12/20/23   Mike Meadows                           Initial Version
    1.1   12/21/23   Mike Meadows                           Created a Commment Framework
*/
import { LightningElement, api } from 'lwc';
import { subscribe} from 'lightning/empApi';
import fireEvent from'@salesforce/apex/FirePlatformEvent.fireEvent';
/* *********************************************************
    @Method Name    : handleClick
    @author         : Mike Meadows
    @description    : used to imperatively call Apex Class
    @param          : none
    @return         : void
********************************************************
*/ 
export default class PlatformEventEmitter extends LightningElement {
    handleClick(){
        let message = 'test message';
        fireEvent({message: message}).then(result =>{
            console.log('result (should be void) : ' + result)
        })
        .catch(error =>{
            console.log(error)
        })

    }


    value;
    subscription = {};
    @api channelName = '/event/Test_Platty_Event__e';

    connectedCallback() {
        this.handleSubscribe();
    }

 /* *********************************************************
    @Method Name    : handleSubscribe
    @author         : Mike Meadows
    @description    : the subsciption to Platform events - then converts data
    @param          : none
    @return         : void
********************************************************
*/ 
    handleSubscribe() {
        const self = this;
        const messageCallback = function (response) {
            console.log('New message received 1: ', JSON.stringify(response));
            console.log('New message received 2: ', response);
            let obj = JSON.parse(JSON.stringify(response));
            console.log(obj.data.payload.Little_Message__c);
            self.value = obj.data.payload.Little_Message__c;
        };
 
        subscribe(this.channelName, -1, messageCallback).then(response => {
            console.log('Subscription request sent to: ', JSON.stringify(response.channel));
            this.subscription = response;
        });
    }
}