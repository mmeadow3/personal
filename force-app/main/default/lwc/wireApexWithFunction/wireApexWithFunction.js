import { LightningElement, wire } from 'lwc';
import getAccList from '@salesforce/apex/AccController.getAccList';


export default class WireApexWithFunction extends LightningElement {

    accounts;
    error;

    @wire(getAccList)
    wiredAccounts({error, data}){
        if (data){
            this.accounts = data;
        } else if (error){
            this.error = error;
        }
    }
}