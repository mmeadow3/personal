import { LightningElement } from 'lwc';
import { sayHelloFromServiceClass, returnSomeTestData } from 'c/exampleServiceClass';  ///// import from the service class
import CATPIC from '@salesforce/resourceUrl/Cat_Pic';
import Id from "@salesforce/user/Id";

export default class SlotExampleParent extends LightningElement {
    response;
    staticResourceCat = CATPIC;
    userId = Id;
    renderedCallback() {
// also this is a good example of how to call a funciton on load for LWC
///// but these will be called every time the DOM is updated
        sayHelloFromServiceClass();
        console.log(JSON.stringify(returnSomeTestData()));
    }

    async getItems() {
        const response = await fetch("https://catfact.ninja/fact"); ///// have to add to trusted URLs
        const result = await response.json();
        this.response = result.fact;
        console.log(result.fact);
      }
}