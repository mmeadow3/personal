import { LightningElement } from 'lwc';
import callApexExample from '@salesforce/apex/SOLIDOpenCloseLWC.getDataForUI'
import { objectService } from './objectService';

export default class SolidOpenClosed extends LightningElement {

    header = "Open Closed Principle";
    message;

    connectedCallback(){
        this.callMethod();
        this.demoOpenClosed();
    }
    
    callMethod(){
        callApexExample({"objectApiName": "Lead"}).then(data => {
            console.log(data);
        })
    }

    demoOpenClosed(){
        const objectSerobjecvice = new objectService();
        this.message = objectSerobjecvice.setMessage('Contact');
    }
}