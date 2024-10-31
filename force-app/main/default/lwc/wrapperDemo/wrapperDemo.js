import { LightningElement, wire } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import ACC_NAME from "@salesforce/schema/Account.Name";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAccountsWithWrapper from '@salesforce/apex/WrapperDemo.getAccountsWithWrapper';

const columns = [
    {
        label : 'Account Name',
        fieldName : 'accountLink',
        type : 'url',
        editable: true,
        typeAttributes :{
            label : {
                fieldName : 'accountName'            },
            target : '_blank'
      }
    },
    { 
        label : 'Type',
        fieldName : 'type'
    },
    { 
        label : 'Test',
        fieldName : 'newName',
        type : 'text',
        editable: true
    },
    {   
        label : 'Total Contacts',
        fieldName : 'totalContacts'
    },
    {
        label : 'Address',
        fieldName : 'billingAddress'
    }
]

export default class WrapperDemo extends LightningElement {
    columns = columns;
    data;
    error;
    //newName;
    
    @wire(getAccountsWithWrapper)
    wiredAccountData({error, data}){
        if(data){
            this.data = data;
        } else {
            this.error = error;
        }
    }

    handleSave(event){
        console.log(event.details.draftValues)
    }


}