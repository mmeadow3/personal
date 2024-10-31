public with sharing class SOLIDSrpEmailLead {
///// This is broken out from SOLIDSrp example class

    public static void sendLeadConversionNotification() {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Lead Converted');
        email.setPlainTextBody('Lead was successfully converted.');
        email.setToAddresses(new String[] { 'mmeadow33@gmail.com' });
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }
}