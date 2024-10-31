import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import FIRST_TEST_CHANNEL from '@salesforce/messageChannel/Second_Test__c';

export default class ApexHours extends LightningElement {
    value = 'test';
///// example of a getter 
    get upperCase(){
        return this.value.toUpperCase();
    }

    showData = false;
    handleCheck(event){
        this.showData = event.target.checked;
    }

    @wire(MessageContext)
    messageContext;

    sendLMS() {
        const payload = { 
            messageToSend: 'Hey Yo',
            number: 1
        };
        publish(this.messageContext, FIRST_TEST_CHANNEL, payload);
      }
}