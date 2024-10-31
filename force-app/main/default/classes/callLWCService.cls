public with sharing class callLWCService {

    private IdynamicLWC lwcInterface; 
    ////constructor
    public callLWCService(IdynamicLWC interfaceClass) {
        System.debug('inside of callLWCService: ' + interfaceClass);
        this.lwcInterface = interfaceClass;   ///// This is an example of Dependency Injection
                                            //// when this class is constructed, we want to pass in the class it is dependent on
    }

    public void sayHello(){
        System.debug('inside of interfaceClass SayHello Method');
        lwcInterface.sayHello();
    }
    
    public void sayGoodbye(){
        lwcInterface.sayGoodbye();
    } 
}