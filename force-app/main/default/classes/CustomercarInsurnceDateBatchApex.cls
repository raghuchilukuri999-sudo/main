public class CustomercarInsurnceDateBatchApex implements Database.Batchable<SObject>, Database.Stateful {

    // List to store email information in a serializable format
    private List<Map<String, String>> emailInfoList = new List<Map<String, String>>();
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, Name, Customer_Email__c, Car_Insurance_Took_On__c, Car_Insurance_Ends_On__c, Car_Insurance_Remainder_Picklist__c ' +
                       'FROM Customer__c ' +
                       'WHERE Car_Insurance_Ends_On__c < TODAY AND Car_Insurance_Remainder_Picklist__c <> \'Term Ended longback\'';
        
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Customer__c> processedCustomerRecords) {
        List<Customer__c> custList = new List<Customer__c>();
        
        for (Customer__c cust : processedCustomerRecords) {
            // Update the picklist value
            cust.Car_Insurance_Remainder_Picklist__c = 'Term Ended longback';
            custList.add(cust);

            // Store email information in a serializable format
            Map<String, String> emailInfo = new Map<String, String>();
            emailInfo.put('email', cust.Customer_Email__c);
            emailInfo.put('endDate', String.valueOf(cust.Car_Insurance_Ends_On__c));
            emailInfoList.add(emailInfo);
        }
        
        if (!custList.isEmpty()) {
            update custList;
        }
    }
           
    public void finish(Database.BatchableContext bc) {
        // Send all emails in the post-processing step
        if (!emailInfoList.isEmpty()) {
            List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
            for (Map<String, String> emailInfo : emailInfoList) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new String[] { emailInfo.get('email') });
                email.setSubject('Your Car Insurance Term Ended');
                email.setPlainTextBody('Dear Customer, your car insurance term ended on ' + emailInfo.get('endDate') + '. Please renew your insurance.');
                emails.add(email);
            }
            Messaging.sendEmail(emails);
        }
    }
}