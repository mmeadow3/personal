public with sharing class SOLIDSrpConvertLead {
///// This is broken out from SOLIDSrp example class


    public static Database.LeadConvertResult convertLead(Id leadId) {
        Database.LeadConvert leadConvert = new Database.LeadConvert();
        leadConvert.setLeadId(leadId);
        leadConvert.setDoNotCreateOpportunity(false);

        LeadStatus convertStatus = [SELECT Id, ApiName FROM LeadStatus WHERE IsConverted=true WITH SECURITY_ENFORCED LIMIT 1 ];
        leadConvert.setConvertedStatus(convertStatus.ApiName);

        Database.LeadConvertResult result = Database.convertLead(leadConvert);

        if (!result.isSuccess()) {
            System.debug('Lead conversion failed.');
        }

        return result;
    }
}