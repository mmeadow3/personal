import { LightningElement } from 'lwc';
import findAccountList from '@salesforce/apex/AccController.findAccountList';

export default class ImperativeApexWithParam extends LightningElement {
    searchKey = '';
    accounts;
    error;

    search(event){
        this.searchKey = event.target.value;
        findAccountList({keyword : this.searchKey}).then((data => {
            this.accounts = data;
        }))
    }

}