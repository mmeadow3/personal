import { LightningElement } from 'lwc';
import { api } from 'lwc';
import callTheMethod from '@salesforce/apex/callLWCinterfaceController.callMethod';

export default class DynamicInterfaceComp extends LightningElement {
    @api identifier;  //// This has to be set in the metadata property
    @api recordId; ////// this is all we have to declare to get the record ID
    clickedButtonLabel;

    handleClick(event) {
        this.clickedButtonLabel = event.target.label;
        console.log(this.clickedButtonLabel);
        console.log(this.identifier);
        console.log(this.recordId);
        callTheMethod({"className": this.identifier});
    }
}