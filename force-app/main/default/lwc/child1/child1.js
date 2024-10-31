import { LightningElement, api } from 'lwc';

export default class Child1 extends LightningElement {
    @api percentage;

    ///// dynamaic styling
    get dynamicStyle(){
        return `background-color:red; min-height: 50px; width: ${this.percentage}%;`
    }
}