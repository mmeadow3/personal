import { LightningElement } from 'lwc';

export default class FactoryDesignPattern extends LightningElement {


    header = 'Factory Design Pattern';

    get value(){
        return 'Creational Patterns';
    }

    get options() {
        return [
                 { label: 'Creational Patterns', value: 'Creational Patterns'},
                 { label: 'Structural Patterns', value: 'Structural Patterns'},
                 { label: 'Behavioral Patterns', value: 'Behavioral Patterns'}
               ];
    }

    get isDisabled(){
        return true;
    }


}