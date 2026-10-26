@isTest
private class DeleteLeadsBatchApexClassTestClass {
    
    @TestSetup
    private static void setUpTestData() {
        // Creating a list to bulk insert the leads
        List<Lead> leadsList = new List<Lead>();
        
        // We need a loop to create bulk records so that we can bulk test
        for (Integer i = 1; i <= 200; i++) {
            // Create an instance to create the Lead records
            Lead l = new Lead();
            l.FirstName = 'delete test leads ' + i;
            l.LastName = 'v' + i;
            l.Company = 'delete company ' + i;
            l.Status = 'Closed-Notconverted';
            l.LeadSource = 'Dreamforce';
            
            // Add these records to the list
            leadsList.add(l);
        }
        
        // Now check if our adding is successful or not by checking if the list is empty
        if (!leadsList.isEmpty()) {
            // Bulk insert the records
            insert leadsList;
        }
    }
    
    @isTest
    private static void actualTest() {
        Test.startTest();
        
        // Calling the DeleteLeadsBatchApexClass by creating an instance
        DeleteLeadsBatchApexClass batchClassInstance = new DeleteLeadsBatchApexClass();

        // Let the batch size be 200
        Id batchId = Database.executeBatch(batchClassInstance, 200);
        
        Test.stopTest();
        
        // Now try to fetch the data that was inserted because if the records' lead status is Closed-Notconverted, it should already be deleted by now
        List<Lead> leads = [SELECT Id, FirstName, LastName, Status FROM Lead WHERE Status = 'Closed-Notconverted'];
        
        // Checking the fetched values with the actual
        System.assertEquals(0, leads.size());
    }
}