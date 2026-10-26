@isTest
private class ClosedlostvalidateTestClass {
    @isTest
    private static void unittest(){
        // Create and insert an account
        Account acc = new Account();
        acc.Name = 'jockey';
        insert acc;
        
        // Test-1: Attempt to delete an opportunity with a non 'Closed Lost' stage by a non-Sales Team user
        Opportunity opp = new Opportunity();
        opp.Name = 'Venkaiahh';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.newInstance(2024, 1, 17);
        opp.AccountId = acc.Id;
        insert opp;
        
        try {
            delete opp;
            System.assert(false, 'Expected an exception since the opportunity stage is not Closed Lost and the user is not part of the Sales Team');
        } catch (DmlException e) {
            System.assertEquals(true, e.getMessage().contains('This Opportunity can\'t be deleted because its Stage Name is not "Closed Lost" or the user who is attempting to delete this record is not from the Sales Team public group.'));
        }

        // Test-2: Attempt to delete an opportunity with 'Closed Lost' stage by a non-Sales Team user
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Vruhan';
        opp2.StageName = 'Closed Lost';
        opp2.CloseDate = Date.newInstance(2024, 1, 17);
        opp2.AccountId = acc.Id;
        insert opp2;
        
        delete opp2; // This should succeed

        // Add the current user to the Sales Team public group
        Group salesTeamGroup = [SELECT Id FROM Group WHERE Name = 'Sales Team' LIMIT 1];
        GroupMember gm = new GroupMember(GroupId = salesTeamGroup.Id, UserOrGroupId = UserInfo.getUserId());
        insert gm;
        
        // Test-3: Attempt to delete an opportunity with a non 'Closed Lost' stage by a Sales Team user
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Another Opp';
        opp3.StageName = 'Prospecting';
        opp3.CloseDate = Date.newInstance(2024, 1, 17);
        opp3.AccountId = acc.Id;
        insert opp3;
        
        delete opp3; // This should succeed

        // Test-4: Attempt to delete an opportunity with 'Closed Lost' stage by a Sales Team user
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Final Opp';
        opp4.StageName = 'Closed Lost';
        opp4.CloseDate = Date.newInstance(2024, 1, 17);
        opp4.AccountId = acc.Id;
        insert opp4;
        
        delete opp4; // This should succeed
    }
}