public with sharing class callLWCinterfaceController {
  @AuraEnabled
  public static void callMethod(String className){
//// call the Serivce Method
System.debug('Inside of callLWCinterfaceController');
    Type interfaceType = Type.forName(className);  //// Type class allows you to create a Class from a String
    System.debug('Type  ' + interfaceType);
    IdynamicLWC interfaceInstance = (IdynamicLWC)interfaceType.newInstance();
    System.debug('interface instance:   ' + interfaceInstance);
    callLWCService c = new callLWCService(interfaceInstance);
    System.debug('inside callLWCService:  ' + c);
    c.sayHello();
  }

  public static void callOther(String className){
    //// call the Serivce Method
        Type interfaceType = Type.forName(className);  //// Type class allows you to create a Class from a String
        IdynamicLWC interfaceInstance = (IdynamicLWC)interfaceType.newInstance();
        callLWCService c = new callLWCService(interfaceInstance);
        c.sayGoodbye();
      }
}