import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import getAccList from '@salesforce/apex/AccountController.getAccList';
import FIRST_TEST_CHANNEL from '@salesforce/messageChannel/Second_Test__c';

export default class GetAccountList extends LightningElement {
    subscription = null;
    test;

    @wire(getAccList) accounts;

    @wire(MessageContext)
    messageContext;
    subscribeToMessageChannel() {
      this.subscription = subscribe(
        this.messageContext,
        FIRST_TEST_CHANNEL,
        (message) => this.handleMessage(message)
      );
    }

    handleMessage(message){
        console.log(message);
        console.log(message.messageToSend);
        console.log(message.number);
        this.test = message.messageToSend;

    }

    connectedCallback() {
        this.subscribeToMessageChannel();
      }
}