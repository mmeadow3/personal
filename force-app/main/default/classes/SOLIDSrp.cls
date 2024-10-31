public with sharing class SOLIDSrp {

        ///// this an example of What Not To Do
        /// all the logic is housed in one class 

        // Here, this class is doing too much:

        // It’s responsible for validating the lead.
        // It’s responsible for converting the lead.
        // It’s responsible for sending notifications.

        // This violates SRP because the class has more than one reason to change


        //// We break these each out into their own classes:
        // Validate Lead - SOLIDSrpValidateLead
        // Convert Lead - SOLIDSrpConvertLead
        // Email Lead - SOLIDSrpEmailLead

        ///Then we make a service class that only coordinates the different services but doesn’t perform any of the individual tasks.
        //SOLIDSrpConverstionService

        public void convertLead(Id leadId) {
            // Step 1: Validate lead
            Lead lead = [SELECT Id, Status FROM Lead WHERE Id = :leadId WITH SECURITY_ENFORCED];
            if (lead.Status != 'Qualified') {
                System.debug('Error: cant do this');
            }
    
            // Step 2: Convert lead
            Database.LeadConvert leadConvert = new Database.LeadConvert();
            leadConvert.setLeadId(leadId);
            leadConvert.setDoNotCreateOpportunity(false);
            Database.LeadConvertResult result = Database.convertLead(leadConvert);
            if (!result.isSuccess()) {
                System.debug('Error: cant do this');
            }
    
            // Step 3: Send notification
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject('Lead Converted');
            email.setPlainTextBody('Lead was successfully converted.');
            email.setToAddresses(new String[] { 'admin@example.com' });
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        }

        // How to run this bih :?
        
        // Lead qualifiedLead = new Lead(Status = 'New', LastName = 'Meadows SRP Test', Company = 'The Meadows Factory');
        // insert qualifiedLead;
        // SOLIDSrpConverstionService.convertLead(qualifiedLead.Id);
    
}