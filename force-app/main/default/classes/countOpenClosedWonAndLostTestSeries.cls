@isTest
private class countOpenClosedWonAndLostTestSeries {
    
    @isTest
    private static void unitTest(){
        
        // Create and insert an Account
        Account acc = new Account(Name = 'sorrasooram');
        insert acc;
        
        // Create and insert Opportunities
        Opportunity opp1 = new Opportunity(Name = 'buskum', StageName = 'Prospecting', CloseDate = Date.today(), AccountId = acc.Id);
        insert opp1;
        
        Opportunity opp2 = new Opportunity(Name = 'rascal', StageName = 'Closed Won', CloseDate = Date.today(), AccountId = acc.Id);
        insert opp2;
        
        Opportunity opp3 = new Opportunity(Name = 'mental', StageName = 'Closed Lost', CloseDate = Date.today(), AccountId = acc.Id);
        insert opp3;
        
        Opportunity opp4 = new Opportunity(Name = 'thikkal', StageName = 'Prospecting', CloseDate = Date.today(), AccountId = acc.Id);
        insert opp4;

        // Fetch the Account again to verify the counts
        acc = [SELECT Number_of_Open_Deals__c, Number_of_Closed_Won_Deals__c, Number_of_Closed_Lost_Deals__c FROM Account WHERE Id = :acc.Id];

        // Assert the counts
        System.assertEquals(2, acc.Number_of_Open_Deals__c, 'Number of open deals should be 2');
        System.assertEquals(1, acc.Number_of_Closed_Won_Deals__c, 'Number of closed won deals should be 1');
        System.assertEquals(1, acc.Number_of_Closed_Lost_Deals__c, 'Number of closed lost deals should be 1');
    }
}