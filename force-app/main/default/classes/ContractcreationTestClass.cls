@isTest
private class ContractcreationTestClass {
    
    @isTest
    private static void unittest() {
        // Create and insert first account
        Account acc = new Account(Name = 'bruhannala');
        insert acc;
        
        // Create and insert first opportunity with stage 'Closed Won'
        Opportunity opp = new Opportunity(
            Name = 'vullala',
            CloseDate = Date.newInstance(2024, 1, 17),
            StageName = 'Closed Won',
            AccountId = acc.Id
        );
        insert opp;
        
        // Verify that a contract has been created for the first opportunity
        List<Contract> contracts1 = [SELECT Id, Status, AccountId, StartDate, ContractTerm FROM Contract WHERE AccountId = :acc.Id];
        System.assertEquals(1, contracts1.size());
        System.assertEquals('Draft', contracts1[0].Status);
        System.assertEquals(acc.Id, contracts1[0].AccountId);
        System.assertEquals(Date.newInstance(2024, 1, 18), contracts1[0].StartDate);
        System.assertEquals(12, contracts1[0].ContractTerm);
        
        // Create and insert second account
        Account acc2 = new Account(Name = 'babruvah');
        insert acc2;
        
        // Create and insert second opportunity with stage 'Needs Analysis'
        Opportunity opp2 = new Opportunity(
            Name = 'valhalla',
            CloseDate = Date.newInstance(2024, 1, 17),
            StageName = 'Needs Analysis',
            AccountId = acc2.Id
        );
        insert opp2;
        
        // Verify that no contract has been created for the second opportunity initially
        List<Contract> contracts2Initial = [SELECT Id, Status, AccountId FROM Contract WHERE AccountId = :acc2.Id];
        System.assertEquals(0, contracts2Initial.size());
        
        // Update second opportunity stage to 'Closed Won'
        opp2.StageName = 'Closed Won';
        update opp2;
        
        // Verify that a contract has been created for the second opportunity after stage update
        List<Contract> contracts2 = [SELECT Id, Status, AccountId, StartDate, ContractTerm FROM Contract WHERE AccountId = :acc2.Id];
        System.assertEquals(1, contracts2.size());
        System.assertEquals('Draft', contracts2[0].Status);
        System.assertEquals(acc2.Id, contracts2[0].AccountId);
        System.assertEquals(Date.newInstance(2024, 1, 18), contracts2[0].StartDate);
        System.assertEquals(12, contracts2[0].ContractTerm);
    }
}