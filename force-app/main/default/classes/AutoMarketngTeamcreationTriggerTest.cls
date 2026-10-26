@isTest
public class AutoMarketngTeamcreationTriggerTest {
    
    @isTest
    static void testAutoMarketngTeamcreation() {
        // Start test context
        Test.startTest();
        
        // Create and insert a Toyoto_Branch__c record
        Toyoto_Branch__c newToyotoBranch = new Toyoto_Branch__c(Name = 'Chennai Branch');
        insert newToyotoBranch;
        
        // Create a new Car_Type__c record
        Car_Type__c newCarType = new Car_Type__c(Name = 'Test Car Type', Car_Price__c = 1444345);
        
        // Insert the Car_Type__c record
        insert newCarType;
        
        // Query the newly created Marketing_Team__c record
        Marketing_Team__c[] marketingTeams = [SELECT Id, Name, Marketing_Car_Type__c, Marketing_Related_Branch_del__c 
                                               FROM Marketing_Team__c 
                                               WHERE Marketing_Car_Type__c = :newCarType.Id];
        
        // End test context
        Test.stopTest();
        
        // Assert that exactly one Marketing_Team__c record was created
        System.assertEquals(1, marketingTeams.size(), 'One Marketing_Team__c record should be created');
        
        // Assert that the name of the Marketing_Team__c record is correct
        System.assertEquals('Test Car Type Marketing Team', marketingTeams[0].Name, 'The name of the Marketing_Team__c record should be correct');
        
        // Assert that the Marketing_Team__c record is linked to the correct Car_Type__c record
        System.assertEquals(newCarType.Id, marketingTeams[0].Marketing_Car_Type__c, 'The Marketing_Team__c record should be linked to the correct Car_Type__c record');
        
        // Assert that the Marketing_Team__c record has a value for Marketing_Related_Branch_del__c
        System.assertNotEquals(null, marketingTeams[0].Marketing_Related_Branch_del__c, 'The Marketing_Team__c record should have a value for Marketing_Related_Branch_del__c');
        
        // Updating the Car_Type__c record
        newCarType.Car_Price__c = 4782425;
        update newCarType;
    }
}