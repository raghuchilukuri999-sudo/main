@isTest
private class SetTheUndeletedCheckboxToTrue {

    @isTest
    private static void unitTest() {
        // Create and insert an account
        Account acc = new Account();
        acc.Name = 'Bootham';
        insert acc;
        
        // Create and insert an opportunity associated with the account
        Opportunity opp = new Opportunity();
            opp.Name = 'Vangibath'; 
            opp.StageName = 'Closed Won'; 
            opp.CloseDate = Date.today(); 
            opp.AccountId = acc.Id;
        
        insert opp;
    
        // Create and insert a quote associated with the opportunity
        Quote qt = new Quote();
            qt.Name = 'Choodandisaaru';
            qt.undeleted__c = false;
            qt.OpportunityId = opp.Id;
        
        insert qt;
        
        // Delete and undelete the quote
        delete qt;
        undelete qt;
        
        // fetch the quote to check its status
        Quote undeletedQuote = [SELECT IsDeleted FROM Quote WHERE Id = :qt.Id];
        
        // Assert that the quote is not deleted anymore
        System.assertEquals(false, undeletedQuote.IsDeleted);
    }
}