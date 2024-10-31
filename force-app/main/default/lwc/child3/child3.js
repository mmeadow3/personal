import { LightningElement } from 'lwc';

export default class Child3 extends LightningElement {
    handleClick(){
        this.dispatchEvent(new CustomEvent("increasecount"));  //// can name the event anything
    }

}