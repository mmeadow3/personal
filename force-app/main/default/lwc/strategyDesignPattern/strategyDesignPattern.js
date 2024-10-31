import { LightningElement } from 'lwc';

export default class StrategyDesignPattern extends LightningElement {

    header = 'Strategy Design Pattern';

    get value(){
        return 'Behavioral Patterns';
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