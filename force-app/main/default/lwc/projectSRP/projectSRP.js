import { LightningElement} from 'lwc';
//import { api } from 'lwc';
import callApexClass from '@salesforce/apex/ProjectSRPController.callProjectService';

export default class ProjectSRP extends LightningElement {
    value = '-- None -- ';

     handleClick(){
        console.log(this.value);
        callApexClass({"userType": this.value}).then(() =>{
            console.log("done");
        }).catch((err) => {
            console.log('error : ' + err.message);
        })
    }


    get options() {
        return [
            { label: 'CTO', value: 'CTO' },
            { label: 'Sales Associate', value: 'Sales Associate' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
    }
}