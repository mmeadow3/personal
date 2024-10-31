public with sharing class SOLIDdipCaseClose_Service {

    public static Map<String, Type> caseTypes = new Map<String, Type>{
        ///// These are the 2 record Types of Case that we are accounting for
        'Delivery' => SOLIDdipCaseCloseServiceDelivery_Impl.class,
        'Order' => SOLIDdipCaseCloseServiceOrder_Impl.class
    };

    public static void determineIfCaseShouldClose(List<Case> cases, String recordType) {
        ///// implement the Factory Pattern to make this work!!!!!!
        SOLIDdip caseClosureService = (SOLIDdip)caseTypes.get(recordType).newInstance(); ///// Iniitalizing one of the classes through the interface
        caseClosureService.determineIfCaseShouldClose(cases); //// This will always be there since the Interface makes it have this method
    }
}