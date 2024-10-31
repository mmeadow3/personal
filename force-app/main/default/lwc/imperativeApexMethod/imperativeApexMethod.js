import { LightningElement } from 'lwc';
import getAccList from '@salesforce/apex/AccController.getAccList';

export default class ImperativeApexMethod extends LightningElement {
    accounts;
    error; 
    
    handleClick(){
        getAccList().then((result => {
            this.accounts = result;
        })).catch((error) => {
            this.error = error;
            console.log(error);
        })
    }
}