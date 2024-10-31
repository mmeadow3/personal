import { LightningElement, wire, api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class ContactSample extends LightningElement {
  contact; 
  error;
  @api recordId;
  name;

  
  @wire(getRecord, { recordId:  "$recordId",  fields: ['Contact.Name', 'Contact.Title'] }) 
  handleRecord({ error, data }) {
    if (data) {
      const { fields } = data;
      
      // 👍: Only copy what is needed.
      this.contact = {
        fields: {
          ...fields,
          Summary: {
            value: `${fields.Name.value} (${fields.Title.value})` 
          }
        }
      };
      console.log(data);  //// returns alot of Contact Data
      console.log(fields);  ///// When we use destructuring - We get back only for the fields we queired
      console.log(JSON.stringify(this.contact))
      console.log(this.contact.fields.Summary.value);
      this.name = fields.Name.value;
    } else if (error){
        console.log('heyyyyy');
        this.error = error;
    }

    let person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};
    console.log((JSON.stringify(person)))  /////////// Annoying feature - cant see the Object bc of the proxy LWC uses
  }
  }