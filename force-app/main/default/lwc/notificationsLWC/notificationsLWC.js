import { LightningElement } from 'lwc';
import LightningAlert from 'lightning/alert';
import LightningPrompt from 'lightning/prompt';
import LightningConfirm from 'lightning/confirm';

export default class NotificationsLWC extends LightningElement {

    async handleAlert(){
            await LightningAlert.open({
                message: 'this is the alert message',
                theme: 'error', // a red theme intended for error states
                label: 'Error!', // this is the header text
            });
            //Alert has been closed
    }

    async handleConfirm() {
        const result = await LightningConfirm.open({
            message: 'this is the prompt message',
            variant: 'headerless',
            label: 'this is the aria-label value',
            // setting theme would have no effect
        });
        //Confirm has been closed
        //result is true if OK was clicked
        //and false if cancel was clicked
    }

    handlePrompt() {
        LightningPrompt.open({
            message: 'this is the prompt message',
            //theme defaults to "default"
            label: 'Please Respond', // this is the header text
            defaultValue: 'initial input value', //this is optional
        }).then((result) => {
            console.log(result) //// if cancel  == null
        });
    }

}