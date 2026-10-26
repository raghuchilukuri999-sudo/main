@isTest
private class ExpireContractsTestClass {
    
    @TestSetup // This annotation is used to setup the test data
    private static void setupTestData() {
        // Create an Account
        Account acc = new Account();
        acc.Name = 'Vriddimansaha';
        insert acc;
        
        // Create a list to bulk insert the Contracts
        List<Contract> contList = new List<Contract>();
        
        // Create 200 contracts to insert
        for (Integer i = 1; i <= 200; i++) {
            // For each iteration, create a contract
            Contract contr = new Contract();
            contr.StartDate = Date.newInstance(2023, 01, 01);
            contr.Status = 'Draft';
            contr.ContractTerm = 12;
            contr.AccountId = acc.Id; // Link contract to the created account
            contList.add(contr); // Add each contract to the list
        }
        
        // Check if there are any contracts in the list
        if (contList.size() > 0 && !contList.isEmpty()) {
            insert contList;
        }
        
        // Fetch the contracts inserted and iterate through them
        for (Contract cont : contList) {
            // Set each contract as Activated
            cont.Status = 'Activated';
        }
        update contList;
    }
    
    @isTest // Defining the test method
    private static void unitTest() {
        Test.startTest();
        // Create an instance of the Batch Class
        ExpireContractsBatch batchClassObject = new ExpireContractsBatch();
        // Call the batch class using executeBatch method in which instance name and size
        ID batchId = Database.executeBatch(batchClassObject, 1);
        Test.stopTest();
        
        // Verify if all the contracts' status got updated to Expired
        List<Contract> contracts = [SELECT Id, Status, Account.Name FROM Contract WHERE Account.Name = 'Vriddimansaha' AND Status = 'Expired'];
        System.assertEquals(200, contracts.size());
    }
}