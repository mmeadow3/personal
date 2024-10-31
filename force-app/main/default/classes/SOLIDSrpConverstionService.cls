public with sharing class SOLIDSrpConverstionService {
///// This is broken out from SOLIDSrp example class

    public static void convertLead(Id leadId) {
        // Step 1: Validate the lead
        Lead lead = [SELECT Id, Status FROM Lead WHERE Id = :leadId WITH SECURITY_ENFORCED];
        SOLIDSrpValidateLead.validateLeadForConversion(lead);

        // Step 2: Convert the lead
        Database.LeadConvertResult result = SOLIDSrpConvertLead.convertLead(leadId);

        // Step 3: Send notification
        SOLIDSrpEmailLead.sendLeadConversionNotification();
    }
}