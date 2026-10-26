@isTest
private class CustomercarInsurnceDateBatchApexTest {
    
    @TestSetup
    private static void setupTestData() {
        // Create a list to make the bulk inserting easy
        List<Customer__c> custList = new List<Customer__c>();
        
        // Create a loop to create fewer records to avoid email limit exceed
        for (Integer i = 1; i <= 10; i++) {
            Customer__c cust = new Customer__c();
            cust.Name = 'Customer' + i;
            cust.Customer_Email__c = 'customer' + i + '@example.com';
            cust.Car_Insurance_Took_On__c = Date.today().addMonths(-12); // Set to 12 months ago
            cust.Car_Insurance_Term_In_Months__c = 6; // Set term to 6 months
            cust.Car_Insurance_Remainder_Picklist__c = 'Term is Newly Taken';
            
            custList.add(cust);
        }
        
        if (!custList.isEmpty()) {
            insert custList;
        }
    }
    
    @isTest
    private static void testBatchProcessing() {
        Test.startTest();
        
        // Calling the batch Apex class by creating a new instance for it
        CustomercarInsurnceDateBatchApex custBatchInstance = new CustomercarInsurnceDateBatchApex();
        
        // Execute the batch with a batch size of 10
        Database.executeBatch(custBatchInstance, 10);
        
        Test.stopTest();
        
        // Fetching and checking that if our inserted data and the updated data is matching or not using the batch sizes
        List<Customer__c> custFetch = [SELECT Id, Name, Car_Insurance_Remainder_Picklist__c FROM Customer__c WHERE Car_Insurance_Remainder_Picklist__c = 'Term Ended longback'];
        
        // Checking
        System.assertEquals(10, custFetch.size());
    }
}