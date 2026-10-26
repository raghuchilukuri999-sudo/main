@istest
private class DeletecloasedcasesSchedulerTestClass {
    
   @TestSetUp
    private static void setUpTestData(){
        
        // Create a List to Bulk Insert the Cases
        List<Case> casesList = new List<Case>();
        
        // Create an Account
        Account acc = new Account();
        acc.Name = 'Meta';
        acc.Industry = 'Technology';
        acc.Website = 'www.meta.com';
        Insert acc;
        
        // Create a Contact
        Contact con = new Contact();
        con.FirstName = 'Mark';
        con.LastName = 'Zuckerberg';
        con.Email = 'mark.zuckerberg@meta.com';
        con.AccountId = acc.id;
        insert con;
        
        // Create 100 cases raised by the Contact Mark from Meta
        for(Integer i = 1; i <= 100; i++){
            Case cs = new Case();
			cs.AccountId = acc.id;
            cs.ContactId = con.id;
            cs.Description = 'Governor Limit Exception ' + i;
            cs.Priority = 'High';
            cs.Status = 'Closed';
            cs.CreatedDate = Datetime.newInstance(2024,01,25,23,30,45);
            cs.ClosedDate = Datetime.newInstance(2024,01,26,23,30,45);
            cs.Origin = 'Web';
            cs.Subject = 'Governor Limit Exception';
            // Add each case to the List
            casesList.add(cs);
        }
        
        // Check if there are any cases in the List
        if(casesList.size() > 0 && !casesList.isEmpty()){
            // Bulk Insert the Cases
            insert casesList;
        }

    }
    
    @isTest
    private static void unitTest(){
        
        Test.startTest();
        
       		// Name the Job
        	string jobName  = 'Delete Closed Cases which have been Closed 100 days back';
        
        	// Define the Time the Class Needs to be Scheduled
        	string cronExpression = '0 0 23 ? * SAT *';
        
        	// Create an Instance of the Schedulable Apex Class
        	DeleteClosedCasesSchedulerClass schedulable = new DeleteClosedCasesSchedulerClass();
        
        	// Call the Schedulable Class
        	system.schedule(jobName, cronExpression, schedulable);
        
        
        // Execute the Collected Asynchronous Process Synchronously
        Test.stopTest();
        
		// Verify the Results
		List<Case_Archive__c> caseArchives = [SELECT Id,Name FROM Case_Archive__c];
        
        system.assertEquals(100,caseArchives.size());
        
    }

}