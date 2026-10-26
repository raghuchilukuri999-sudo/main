public class QuoteProcessor {
    
    @InvocableMethod(label='Delete Quotes Not Accepted' description='Deletes quotes that were not accepted')
    public static void deleteQuotesNotAccepted(List<Id> opportunityIds) {
        // Fetch the quotes which are not accepted by the customer
        List<Quote> unacceptedQuotes = [SELECT Id FROM Quote WHERE OpportunityId IN :opportunityIds AND Status != 'Accepted'];

        // Check if there are any unaccepted quotes
        if (!unacceptedQuotes.isEmpty()) {
            // Delete the quotes which are not accepted
            delete unacceptedQuotes;
        }
    }
}