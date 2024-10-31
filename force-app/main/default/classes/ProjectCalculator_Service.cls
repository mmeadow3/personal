public with sharing class ProjectCalculator_Service {
    ///// no interface on this one

    private static Map<String, Type> userTypeMap = new Map<String, Type>{
        'CTO' => ProjectCalculatorCTO_Service.class,
        'Sales Associate' => ProjectCalculatorSales_Service.class
    };

    public static void calculateProject(String userType){
        IProject iproj = (IProject)userTypeMap.get(userType).newInstance();
        iproj.calculateProj();
    }
}