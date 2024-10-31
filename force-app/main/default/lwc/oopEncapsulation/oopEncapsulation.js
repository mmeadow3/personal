import { LightningElement, wire } from 'lwc';
import callApexLWC from '@salesforce/apex/OOPEncapsulation.callApexLWC';

export default class OopEncapsulation extends LightningElement {

    // Private property (Encapsulated)
    ///// also, an underscore to start the Variable name is usually meant to declare the var as PRIVATE
    _balance = 0;

    // getters are public to expose variable 
    ////Getters create Read Only Properties
   /// The getter provides read-only access to the _balance field.
    get balance(){
        return this._balance + 20;
    }

    header = 'Encapsulation';
    value; 


    @wire(callApexLWC)
    wiredNumber({ error, data }) {
        if (data) {
         console.log(data);
         this.value = data;
        } else if (error) {
          console.log(error);
          this.value = error.body.message;
        }
    }
}