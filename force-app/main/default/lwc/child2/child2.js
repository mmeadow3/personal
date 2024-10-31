import { LightningElement, api } from 'lwc';

export default class Child2 extends LightningElement {

    timeStamp = new Date();

    @api ///// add api to the method so it can be called from the Parent Component 
    refresh(){
        this.timeStamp = new Date();
    }
}