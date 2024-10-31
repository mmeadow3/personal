//// this is the service class to apply open close pricinple to an LWC
import { objectServiceContact } from "./objectServiceContact";
import { objectServiceFactory } from "./objectServiceFactory";

export class objectService {

    classType;
    setMessage(objectType){
        //// hard to get away from If/else in JS unless we use TypeScript
        //// still think its better to keep the front end with composition over inheritance 
        //// no interfaces in js 

        if(this.objectApiName === 'Contact'){
            ////make sure this is imported at the top
            this.classType = new objectServiceContact();
        } else if (this.objectApiName === 'Lead'){
            console.log('nothing');
        } else {
            ///// this is what is firing since this is not an object page, same as contact
            this.classType = new objectServiceContact();
        }
        
        const serviceFactory = new objectServiceFactory(this.classType);
        return serviceFactory.setMessage();
    }

}