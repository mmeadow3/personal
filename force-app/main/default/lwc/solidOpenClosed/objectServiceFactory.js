export class objectServiceFactory{
    classType;
    constructor(classType){
        this.classType = classType;
    }

    setMessage(){
        return this.classType.setMessage();
    }
}