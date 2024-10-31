public with sharing class SOLIDdipCaseCloseServiceOrder_Impl implements SOLIDdip {
    public void determineIfCaseShouldClose(List<Case> cases){
        /////logic  
        List<Case> casesToClose = new List<Case>();
        List<Case> casesToReject = new List<Case>();
 
        for(Case cs : cases){
            ///// this is what is different than the other class
            if(cs.Status == 'Ordered'){
                 casesToClose.add(cs);
             }
            else{
                 casesToReject.add(cs);
             }
        }
             
         if(casesToClose.size() > 0){
             closeCases(casesToClose);
         }
 
         if(casesToReject.size() > 0){
             rejectCases(casesToReject);
         }
     }
 
     private static void closeCases(List<Case> c){
         System.debug('Closed this list: ' + c);
     }
 
     private static void rejectCases(List<Case> c){
         System.debug('Rejected this list: ' + c);
     }
}