@isTest
public class TestUpdateCustomerTestDrivePayment {
    @testSetup
    static void setup() {
        // Create test records for custom settings
        customerTestDrivePayment__c setting1 = new customerTestDrivePayment__c(
            Car_Type_choosen__c = 'Fortuner',
            Customer_started_Test_Drive_On__c = Date.newInstance(2024, 7, 20),
            Customer_Minimum_Test_Drive_Days__c = 20,
            Maximum_Test_Drive_Days__c = 25,
            Minimum_Amount_For_Test_Drive__c = 20000,
            Max_Amount_For_Test_Drive__c = 45000,
            The_Test_Drive_Ended_On__c = Date.newInstance(2024, 7, 27)
        );
        insert setting1;
        
        customerTestDrivePayment__c setting2 = new customerTestDrivePayment__c(
            Car_Type_choosen__c = 'Kamandalam',
            Customer_started_Test_Drive_On__c = Date.newInstance(2024, 7, 10),
            Customer_Minimum_Test_Drive_Days__c = 10,
            Maximum_Test_Drive_Days__c = 15,
            Minimum_Amount_For_Test_Drive__c = 10000,
            Max_Amount_For_Test_Drive__c = 35000,
            The_Test_Drive_Ended_On__c = Date.newInstance(2024, 7, 22)
        );
        insert setting2;
    }
    
    @isTest
    static void testTriggerWithMatchingSetting() {
        // Test inserting a Customer__c record with a matching custom setting
        Customer__c customer1 = new Customer__c(
            Name = 'Customer One',
            Car_Type__c = 'Fortuner',
            Number_of_Test_Drive_Days__c = 22
        );
        insert customer1;
        
        // Retrieve the inserted record
        customer1 = [SELECT Car_Type__c, car_Test_Drive_Start_Date_On__c, payment_For_the_Test_Drive__c
                     FROM Customer__c
                     WHERE Id = :customer1.Id];
        
        // Verify the trigger logic
        System.assertEquals(Date.newInstance(2024, 7, 20), customer1.car_Test_Drive_Start_Date_On__c);
        System.assertEquals(45000, customer1.payment_For_the_Test_Drive__c);
        
        // Test updating a Customer__c record to have more test drive days
        customer1.Number_of_Test_Drive_Days__c = 26;
        update customer1;
        
        // Retrieve the updated record
        customer1 = [SELECT Car_Type__c, car_Test_Drive_Start_Date_On__c, payment_For_the_Test_Drive__c
                     FROM Customer__c
                     WHERE Id = :customer1.Id];
        
        // Verify the trigger logic
        System.assertEquals(20000, customer1.payment_For_the_Test_Drive__c);
    }
    
    @isTest
    static void testTriggerWithNoMatchingSetting() {
        // Test inserting a Customer__c record with no matching custom setting
        Customer__c customer2 = new Customer__c(
            Name = 'Customer Two',
            Car_Type__c = 'NonExistentCarType',
            Number_of_Test_Drive_Days__c = 10
        );
        
        Test.startTest();
        try {
            insert customer2;
            System.assert(false, 'Expected DML exception due to no matching custom setting');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('No matching custom setting found for Car Type'));
        }
        Test.stopTest();
    }
    
    @isTest
    static void testTriggerWithBoundaryConditions() {
        // Test inserting a Customer__c record with minimum test drive days
        Customer__c customer3 = new Customer__c(
            Name = 'Customer Three',
            Car_Type__c = 'Kamandalam',
            Number_of_Test_Drive_Days__c = 10
        );
        insert customer3;
        
        // Retrieve the inserted record
        customer3 = [SELECT Car_Type__c, car_Test_Drive_Start_Date_On__c, payment_For_the_Test_Drive__c
                     FROM Customer__c
                     WHERE Id = :customer3.Id];
        
        // Verify the trigger logic
        System.assertEquals(Date.newInstance(2024, 7, 10), customer3.car_Test_Drive_Start_Date_On__c);
        System.assertEquals(35000, customer3.payment_For_the_Test_Drive__c);
    }
}