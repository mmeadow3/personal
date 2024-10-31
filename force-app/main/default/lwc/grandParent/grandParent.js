import { LightningElement } from 'lwc';
import otherTemplate from './otherTemplate.html';

export default class GrandParent extends LightningElement {

    constructor(){
        super(); /// always must call this
        console.log('grandparent Constructor');
    }

    connectedCallback(){
        let element = this.template;
        console.log("grandparent connected callback => " + element);
    }

    render(){
        console.log("grandparent render called");
        // This is the ideal way to reuse an HTML temlate 
        // using the Render method is made for this 
        return otherTemplate; ///// can return a whole new template to render here
    }

    renderedCallback(){
        console.log('grandparent rendered callback, should fire after child renders');
        //// this could cause infinite loop so be careful
    }

    disconnectedCallback(){
        console.log('Grandparent Disconnected Callback');
    }

    errorCallback(error, stack){
        console.log("grandparent error : " + error + '  ' + stack);
    }
}