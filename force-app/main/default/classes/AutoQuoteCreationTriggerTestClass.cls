@isTest
private class AutoQuoteCreationTriggerTestClass {
    
    @isTest
    static void testAutoCreateAQuoteTrigger() {
        // Create a test Account
        Account acc = new Account(Name = 'Bitthiri');
        insert acc;

        // Create a test Product
        Product2 prod = new Product2(Name = 'Bicchi');
        insert prod;

        // Create a test OpportunityLineItem associated with the Product
        OpportunityLineItem opplineitem = new OpportunityLineItem(
            OpportunityId = acc.Id,  // Link to the test Account
            Product2Id = prod.Id,
            Quantity = 1,  // Adjust as per your Product requirements
            UnitPrice = 100  // Adjust as per your Product requirements
        );
        insert opplineitem;

        // Create a test Opportunity with stageName 'Proposal/Price Quote'
        Opportunity opp = new Opportunity(
            Name = 'Vangaga',
            AccountId = acc.Id,
            StageName = 'Proposal/Price Quote',
            Description = 'This is an Opportunity Description'
            // Add any other required fields
        );
        insert opp;

        // Verify that a Quote was created for the Opportunity
        List<Quote> quotes = [SELECT Id FROM Quote WHERE OpportunityId = :opp.Id];
        System.assertEquals(1, quotes.size(), 'Expected 1 Quote to be created');

        // Create another test Account
        Account acc2 = new Account(Name = 'Vulvachar');
        insert acc2;

        // Create another test Opportunity with stageName 'Qualification'
        Opportunity opp1 = new Opportunity(
            Name = 'Gaga',
            AccountId = acc2.Id,
            StageName = 'Qualification',
            Description = 'This is another Opportunity Description'
            // Add any other required fields
        );
        insert opp1;

        // Update the stageName of opp1 to 'Proposal/Price Quote'
        opp1.StageName = 'Proposal/Price Quote';
        update opp1;

        // Verify that a Quote was created for opp1
        List<Quote> quotesForOpp1 = [SELECT Id FROM Quote WHERE OpportunityId = :opp1.Id];
        System.assertEquals(1, quotesForOpp1.size(), 'Expected 1 Quote to be created for opp1');
    }
}