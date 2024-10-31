public with sharing class SOLIDSrpValidateLead {
///// This is broken out from SOLIDSrp example class

    public static void validateLeadForConversion(Lead lead) {
        if (lead.Status != 'Qualified') {
            System.debug('Lead must be qualified to convert.');
        }
    }
}