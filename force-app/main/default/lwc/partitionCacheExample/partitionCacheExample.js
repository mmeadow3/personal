import { LightningElement } from 'lwc';
import storeDataController from '@salesforce/apex/PartitionExampleController.storeDataController'
import retriveDataController from '@salesforce/apex/PartitionExampleController.retrieveDataCacheController'
import retriveDataSOQLController from '@salesforce/apex/PartitionExampleController.retieveDataSOQL'


export default class PartitionCacheExample extends LightningElement {

    connectedCallback(){
        this.storeData();   /// store data on the load of the component
    }



    storeData(){
        storeDataController().then(() => {
            console.log('done storing data');
        })
    }

    retrieveData(){
        retriveDataController().then(data => {
            console.log('done retrieving data  ::: ' + JSON.stringify(data));
        })
    }

    retrieveDataSOQL(){
        retriveDataSOQLController().then(data => {
            console.log('done retrieving data SOQL  ' + JSON.stringify(data));
        })
    }


}