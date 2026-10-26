@isTest
private class CarTypeRollupSummaryTestClass {
    
    @testSetup
    private static void testSetupData() {
        // Insert test data for Car_Type__c
        Car_Type__c car = new Car_Type__c(
            Name = 'TestCarType',
            Total_Number_of_customers__c = 5,
            Total_Amount_Paid_By_The_customers__c = 410,
            Maximum_Discount_Given__c = 14,
            Minimum_Discount_Given__c = 5,
            Average_Amount_Paid_by_The_customers__c = 77
        );
        insert car;
        
        // Insert more Car_Type__c records if necessary for thorough testing
    }
    
    @isTest
    private static void actualTest() {
        Test.startTest();
        CarTypeRollupSummaryBatchApex batchInstance = new CarTypeRollupSummaryBatchApex();
        Id batchId = Database.executeBatch(batchInstance, 200);
        Test.stopTest();
        
        // Validate results
        Car_Type__c car = [SELECT Total_Number_of_customers__c, Total_Amount_Paid_By_The_customers__c, Maximum_Discount_Given__c, Minimum_Discount_Given__c, Average_Amount_Paid_by_The_customers__c FROM Car_Type__c WHERE Name = 'TestCarType' LIMIT 1];
        
        System.assertEquals(5, car.Total_Number_of_customers__c);
        System.assertEquals(410, car.Total_Amount_Paid_By_The_customers__c);
        System.assertEquals(14, car.Maximum_Discount_Given__c);
        System.assertEquals(5, car.Minimum_Discount_Given__c);
        System.assertEquals(77, car.Average_Amount_Paid_by_The_customers__c);
    }
}