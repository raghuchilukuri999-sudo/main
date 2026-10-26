@istest
public class TestFutureMethodUserCreateAndPubGrupAdd {

    @isTest
    static void testUserCreationAndGroupAssignment() {
        // Setup test data
        // Create a Car Type Public Group
        Group publicGroup = new Group();
        publicGroup.Name = 'TestCarType';
        publicGroup.Type = 'Regular'; // 'Regular' for a public group
        insert publicGroup;

        // Create a Profile for the test user
        Profile profile = [SELECT Id FROM Profile WHERE Name = 'Force.com - Free User' LIMIT 1];

        // Create a Car Type
        Car_Type__c carType = new Car_Type__c();
        carType.Name = 'TestCarType';
        insert carType;

        // Create unique Employee records with unique usernames
        Employee__c emp1 = new Employee__c(
            Name = 'John Doe',
            Employee_Email__c = 'john.doe@example.com',
            Employee_Associated_Car_Type__c = carType.Id
        );
        Employee__c emp2 = new Employee__c(
            Name = 'Jane Smith',
            Employee_Email__c = 'jane.smith@example.com',
            Employee_Associated_Car_Type__c = carType.Id
        );

        insert new List<Employee__c>{emp1, emp2};

        // Execute the trigger and future method
        Test.startTest();
        // Trigger will fire here
        Test.stopTest();

        // Verify that users were created
        List<User> createdUsers = [SELECT Id, Email, Username FROM User WHERE Email IN ('john.doe@example.com', 'jane.smith@example.com')];
        System.assertEquals(2, createdUsers.size(), 'Two users should have been created.');

        // Verify that users were added to the public group
        List<GroupMember> groupMembers = [SELECT Id, UserOrGroupId, GroupId FROM GroupMember WHERE UserOrGroupId IN :createdUsers];
        System.assertEquals(2, groupMembers.size(), 'Two group members should have been added to the public group.');

        // Verify that the correct group is used
        for (GroupMember member : groupMembers) {
            System.assertEquals(publicGroup.Id, member.GroupId, 'Group ID should match the created public group.');
        }
    }


}