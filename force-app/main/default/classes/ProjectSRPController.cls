public with sharing class ProjectSRPController {
    @AuraEnabled
    public static void callProjectService(String userType) {
        System.debug(userType);
        ProjectCalculator_Service.calculateProject(userType);
    }
}