@isTest
private class ParentRecordDeletionPreventTest {
    @isTest
    private static void testPreventDeletion() {
        // Create a Car_Type__c record
        Car_Type__c carType = new Car_Type__c(Name = 'Sedan');
        insert carType;
        
        // Create a Customer__c record associated with the Car_Type__c record
        Customer__c customer = new Customer__c(Name = 'John Doe', Car_Type__c = carType.Id);
        insert customer;
        
        // Attempt to delete the Car_Type__c record
        try {
            delete carType;
            // If no exception is thrown, the test should fail
            System.assert(false, 'Expected a DmlException to be thrown due to the Car_Type__c having associated Customer__c records.');
        } catch (DmlException e) {
            // Verify that the error message matches the expected error
            System.assert(e.getMessage().contains('You cannot delete a Car Type that has associated customers.'));
        }
    }
    
    @isTest
    private static void testAllowDeletion() {
        // Create a Car_Type__c record with no associated Customer__c records
        Car_Type__c carType = new Car_Type__c(Name = 'Convertible');
        insert carType;
        
        // Attempt to delete the Car_Type__c record
        delete carType;
        
        // Verify that the Car_Type__c record was successfully deleted
        Car_Type__c deletedCarType = [SELECT Id FROM Car_Type__c WHERE Id = :carType.Id LIMIT 1];
        System.assert(deletedCarType == null, 'Expected the Car_Type__c record to be successfully deleted.');
    }
}