import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {

    percentage = 20;
    handleOnChange(event){
        this.percentage = event.target.value;
    }

    handleClick(){
        this.template.querySelector('c-child2').refresh();
    }

    count = 1;
    handleEventChange(){
        this.count = this.count + 1;  ///// this is event bubbling 
    }

    message;
    handleEventChange4(event){
        this.count = event.detail.value;
        this.message = event.detail.message;
    }

   constructor(){
        super(); /// always must call this
        console.log('parent Constructor');
    }

    connectedCallback(){
        let element = this.template;
        console.log("parent connected callback => " + element);
    }

    // render(){
    //     console.log("parent render called");
    //     return this.template;
    // }

    renderedCallback(){
        console.log('parent rendered callback, should fire after child renders');
        //// this could cause infinite loop so be careful
    }

    disconnectedCallback(){
        console.log('parent Disconnected Callback');
    }

    errorCallback(error, stack){
        console.log("parent error : " + error + '  ' + stack);
    }
}