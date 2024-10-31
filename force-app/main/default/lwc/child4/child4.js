import { LightningElement } from 'lwc';

export default class Child4 extends LightningElement {
    value = 5;

    handleClick(){
        const eventWithValue = new CustomEvent('increase', {
            detail: {
                value : this.value,
                message : 'Hello from child comp 4'
            }
        })
        this.dispatchEvent(eventWithValue);
    }
}