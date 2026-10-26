@isTest
private class AutoAssignaTaskTocaseownerTest {

    @isTest
    static void testAutoAssignTask() {
        // Create a user to assign the case and task to
        User testUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];

        // Create a case record
        Case testCase = new Case(
            Subject = 'Test Case Subject',
            Description = 'Test Case Description',
            Priority = 'Medium',
            Status = 'New',
            OwnerId = testUser.Id
        );

        // Insert the case record
        insert testCase;

        // Retrieve the case record to ensure CreatedDate is available
        testCase = [SELECT Id, CreatedDate FROM Case WHERE Id = :testCase.Id LIMIT 1];

        // Query the task associated with the case
        Task createdTask = [SELECT Id, WhatId, ActivityDate, Description, OwnerId, Priority, Status, Subject 
                            FROM Task WHERE WhatId = :testCase.Id LIMIT 1];

        // Assert the task fields are correctly set
        System.assertNotEquals(null, createdTask, 'Task should be created');
        System.assertEquals(testCase.Id, createdTask.WhatId, 'WhatId should be set to the case Id');
        System.assertEquals(testCase.CreatedDate.date().addDays(7), createdTask.ActivityDate, 'ActivityDate should be 7 days after the case created date');
        System.assertEquals(testCase.Description, createdTask.Description, 'Description should match the case description');
        System.assertEquals(testCase.OwnerId, createdTask.OwnerId, 'OwnerId should match the case owner Id');
        System.assertEquals(testCase.Priority, createdTask.Priority, 'Priority should match the case priority');
        System.assertEquals('Not Started', createdTask.Status, 'Status should be "Not Started"');
        System.assertEquals(testCase.Subject, createdTask.Subject, 'Subject should match the case subject');
    }
}