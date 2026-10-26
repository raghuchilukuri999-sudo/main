@isTest
private class lookupRollupsummaryForAccountTestClass {

    @isTest
    static void testInsertUpdateDeleteUndelete() {
        // Create an Account
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Create Opportunities
        Opportunity opp1 = new Opportunity(Name = 'Test Opportunity 1', AccountId = acc.Id, StageName = 'Prospecting', CloseDate = Date.today(), Amount = 1000);
        Opportunity opp2 = new Opportunity(Name = 'Test Opportunity 2', AccountId = acc.Id, StageName = 'Prospecting', CloseDate = Date.today(), Amount = 2000);
        insert new List<Opportunity>{opp1, opp2};

        // Verify the Account fields after insertion
        acc = [SELECT Number_of_Opportunities__c, Total_Deal_Amount__c, Average_Deal_Amount__c, Maximum_Deal_Amount__c, Minimum_Deal_Amount__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, acc.Number_of_Opportunities__c);
        System.assertEquals(3000, acc.Total_Deal_Amount__c);
        System.assertEquals(1500, acc.Average_Deal_Amount__c);
        System.assertEquals(2000, acc.Maximum_Deal_Amount__c);
        System.assertEquals(1000, acc.Minimum_Deal_Amount__c);

        // Update an Opportunity
        opp1.Amount = 3000;
        update opp1;

        // Verify the Account fields after update
        acc = [SELECT Number_of_Opportunities__c, Total_Deal_Amount__c, Average_Deal_Amount__c, Maximum_Deal_Amount__c, Minimum_Deal_Amount__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, acc.Number_of_Opportunities__c);
        System.assertEquals(5000, acc.Total_Deal_Amount__c);
        System.assertEquals(2500, acc.Average_Deal_Amount__c);
        System.assertEquals(3000, acc.Maximum_Deal_Amount__c);
        System.assertEquals(2000, acc.Minimum_Deal_Amount__c);

        // Soft Delete an Opportunity
        delete opp1;

        // Verify the Account fields after soft deletion
        acc = [SELECT Number_of_Opportunities__c, Total_Deal_Amount__c, Average_Deal_Amount__c, Maximum_Deal_Amount__c, Minimum_Deal_Amount__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(1, acc.Number_of_Opportunities__c);
        System.assertEquals(2000, acc.Total_Deal_Amount__c);
        System.assertEquals(2000, acc.Average_Deal_Amount__c);
        System.assertEquals(2000, acc.Maximum_Deal_Amount__c);
        System.assertEquals(2000, acc.Minimum_Deal_Amount__c);

        // Undelete the Opportunity
        Database.UndeleteResult[] undeleteResults = Database.undelete(new List<Opportunity>{opp1}, false);

        // Verify the Account fields after undeletion
        acc = [SELECT Number_of_Opportunities__c, Total_Deal_Amount__c, Average_Deal_Amount__c, Maximum_Deal_Amount__c, Minimum_Deal_Amount__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, acc.Number_of_Opportunities__c);
        System.assertEquals(5000, acc.Total_Deal_Amount__c);
        System.assertEquals(2500, acc.Average_Deal_Amount__c);
        System.assertEquals(3000, acc.Maximum_Deal_Amount__c);
        System.assertEquals(2000, acc.Minimum_Deal_Amount__c);

        // Hard Delete an Opportunity
        Database.delete(new List<Opportunity>{opp1}, true);

        // Verify the Account fields after hard deletion
        acc = [SELECT Number_of_Opportunities__c, Total_Deal_Amount__c, Average_Deal_Amount__c, Maximum_Deal_Amount__c, Minimum_Deal_Amount__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(1, acc.Number_of_Opportunities__c);
        System.assertEquals(2000, acc.Total_Deal_Amount__c);
        System.assertEquals(2000, acc.Average_Deal_Amount__c);
        System.assertEquals(2000, acc.Maximum_Deal_Amount__c);
        System.assertEquals(2000, acc.Minimum_Deal_Amount__c);
    }
}