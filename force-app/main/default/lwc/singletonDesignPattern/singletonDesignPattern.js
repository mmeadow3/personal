import { LightningElement } from 'lwc';

export default class SingletonDesignPattern extends LightningElement {

    header = "Singleton Design Pattern";

    get options() {
        return [
                 { label: 'Creational Patterns', value: 'Creational Patterns'},
                 { label: 'Structural Patterns', value: 'Structural Patterns'},
                 { label: 'Behavioral Patterns', value: 'Behavioral Patterns'}
               ];
    }

    get value(){
        return 'Creational Patterns';
    }
    
    get isDisabled(){
        return true;
    }
}