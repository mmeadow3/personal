/* eslint-disable no-unused-vars */
/* eslint-disable no-case-declarations */
import { LightningElement, api, wire, track } from 'lwc';
import { addNumbertoField } from 'c/calculatorService';  ///// import from the service class
import { getObjectInfo } from "lightning/uiObjectInfoApi";

export default class CalculatorApp extends LightningElement {
    @api recordId;
    @api objectApiName;
    @track objectInfo;
    @wire(getObjectInfo, { objectApiName: '$objectApiName' })
    objectInfoResults;  //// wire is more efficient than imperative apex

    value = 0; //// only for display
    firstValue = null;
    secondValue = '';
    operation;
    fieldValue;
    fieldName = 'Select';

    constructor(){
        console.log('constructor');
        super(); //// must call super
        //// initialize most variables here unless they have @api decorator
    }

    connectedCallback(){
        ///// most logic should go here if it cant go in the constructor
        ///// if pulling in Static Resources - put them here
    }

    ///// probablyy should have used ConnectedCallback - this is only rendered when the component loads
    renderedCallback() {
        ///// should be used sparingly - could easily cause an infinite loop
        //// usually used to send data to the Child Component - bc Child is actualy rendered 
        ///// this will fire every time data is update - ex: when the picklist is changed or a number is clicked
        //// when ever the DOM is changed
        console.log('Current Object : ' + this.objectApiName);
        console.log('Record Id : '  + this.recordId)  /// Had to remove <target>lightning__AppPage</target> from metadata file for this to work
        //// trying to console.log the @wire objectInfoResults wont work here since the data hasnt been returned yet 
   }

   disconnectedCallback(){
    //// use this to clear cache from localStorage 
    /// remove event listeners 
    ///// remove Lightning Messaging Service
   }

   errorCallback(){
    ////if anything in a child component goes wrong, we can handle it here
   }

    handleClear(){
        this.value = 0;
        this.firstValue = null;
        this.secondValue = '';
        this.operation = null;
    }

    handleEquals(){
        switch (this.operation) {
            case '+':
                this.value = Number(this.firstValue) + Number(this.secondValue);
                // eslint-disable-next-line no-case-declarations
                let firstValue;
                let secondValue;

                if (this.firstValue % 1 !== 0){   /////check for decimal
                    firstValue = this.firstValue.toString().split('.')[1].length;
                } else {
                    firstValue = 0;
                }
                if (this.secondValue % 1 !== 0){
                    secondValue = this.secondValue.toString().split('.')[1].length;
                } else {
                    secondValue = 0;
                }
                let fixedDigits = Math.max(firstValue, secondValue);
                this.value = this.value.toFixed(fixedDigits);
                this.firstValue = this.value;
                break;
            case '-':
                this.value = this.firstValue - this.secondValue;
                this.value = this.value.toFixed(2);
                this.firstValue = this.value;
                break;
            case 'x':
                this.value = this.firstValue * this.secondValue;
                this.value = this.value.toFixed(2);
                this.firstValue = this.value;
                break;
            case '/':
                this.value = this.firstValue / this.secondValue;
                this.value = this.value.toFixed(2);
                this.firstValue = this.value;
                break;
            default:
            console.log('No operation');
        }
    }

    handleDecimal(){
        if (!this.value) {
                this.value = '0.';
                this.firstValue = '0.';
                this.secondValue = '0.';
            } else if (!this.value.includes('.')){
                this.value = this.value + '.'; 
        }

        if (this.operation && this.secondValue && !this.secondValue.includes('.')){
            this.secondValue = this.secondValue + '.';
        }
        if (this.firstValue && !this.firstValue.includes('.')) {
            this.firstValue = this.firstValue + '.';
        }    
    }

    handleNumber(event){
        event.stopPropagation();
        if (this.value === 0){
            this.value = null;
        }
       // console.log(event.target.dataset.test); /// this is just an example of adding attributes to div using data-*
        if (this.operation == null){
            if (this.value === null){
                this.value = event.target.dataset.value;
                this.firstValue = event.target.dataset.value;
            } else {
                this.firstValue = this.firstValue + event.target.dataset.value;
                this.value = this.firstValue;
            }
        }  else {
            this.secondValue = this.secondValue + event.target.dataset.value;
            this.value = this.secondValue;
       }
    }

    handleSubtract(){
        let numberInput = Number(this.refs.calcInput.value);
        this.firstValue = numberInput;
        this.secondValue = '';
        this.operation = '-';
    }

    handlePlus(){
        let numberInput = Number(this.refs.calcInput.value); //// this is passing by a custom "ref" on the HTML - this is preferred over queryselector
        this.firstValue = numberInput;
        this.secondValue = '';
        this.operation = '+';
    }

    handleMultiply(){
        let numberInput = Number(this.refs.calcInput.value);
        this.firstValue = numberInput;
        this.secondValue = '';
        this.operation = 'x';
    }

    handleDivide(){
        let numberInput = Number(this.refs.calcInput.value);
        this.firstValue = numberInput;
        this.secondValue = '';
        this.operation = '/';
    }

    ///use getters to set values
    get options() {
        const fields = [];
        const objectData = this.objectInfoResults.data.fields;  ////make sure the HTML has an if:true to confirm the data exists - otherwise this will error
        for (const [key, value] of Object.entries(objectData)) {   ///// do not remove 'key' or this will not work
            if (value.dataType === 'Currency' || value.dataType === 'Int' || value.dataType === 'Double'){
                fields.push({label: value.label, value : value.apiName})
            }
          }
        return fields;
    }

    handleSelect(event){
        this.fieldValue = event.target.value;
        this.fieldName = event.target.options.find(opt => opt.value === event.detail.value).label;
    }

    addtoField(){
        addNumbertoField(this.recordId, this.fieldValue, this.value);
    }

}