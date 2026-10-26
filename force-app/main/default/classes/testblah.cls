@isTest
private class testblah {
    @isTest
    private static void unitest() {
        // Create a Car_Type__c record
        Car_Type__c carTyp = new Car_Type__c(Name = 'boodidha');
        insert carTyp;
        
        // Create a Customer__c record associated with the Car_Type__c record
        Customer__c customer = new Customer__c(Name = 'konda', Car_Type__c = carTyp.Id);
        insert customer;
        
        // Attempt to delete the Car_Type__c record
        try {
            delete carTyp;
        } catch (DmlException e) {
            // Verify that the error message matches the expected error
            System.assertequals(true,e.getMessage().contains('You cannot delete a Car Type that has associated customers.'));
        }
    }
}