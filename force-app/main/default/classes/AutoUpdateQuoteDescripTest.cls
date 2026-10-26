@isTest
public class AutoUpdateQuoteDescripTest {
    @isTest
    static void testAutoUpdateQuoteDescrip() {
        // Create test data

        // Create an Opportunity
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            CloseDate = Date.today().addDays(30),
            StageName = 'Prospecting',
            Description = 'Initial description'
        );
        insert opp;

        // Create a Quote related to the Opportunity
        Quote qt = new Quote(
            Name = 'Test Quote',
            OpportunityId = opp.Id,
            Description = opp.Description
        );
        insert qt;

        // Update the Opportunity description
        opp.Description = 'Updated description';
        update opp;

        // Fetch the updated Quote
        Quote updatedQuote = [SELECT Id, Description FROM Quote WHERE Id = :qt.Id];

        // Assert the Quote description has been updated
        System.assertEquals('Updated description', updatedQuote.Description);
    }
}