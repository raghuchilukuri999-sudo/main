@isTest
public class UpdateRelatedDescriptionsTest {
    @isTest
    static void testUpdateRelatedDescriptions() {
        // Create test data
        Account testAccount = new Account(Name = 'Test Account', Description = 'Initial Description');
        insert testAccount;

        Contact testContact = new Contact(FirstName = 'Test', LastName = 'Contact', AccountId = testAccount.Id, Description = 'Initial Description');
        insert testContact;

        Opportunity testOpportunity = new Opportunity(Name = 'Test Opportunity', AccountId = testAccount.Id, StageName = 'Prospecting', CloseDate = Date.today());
        insert testOpportunity;

        // Update contact description
        testContact.Description = 'Updated Description';
        update testContact;

        // Verify account description is updated
        Account updatedAccount = [SELECT Id, Description FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals('Updated Description', updatedAccount.Description);

        // Verify opportunity description is updated
        Opportunity updatedOpportunity = [SELECT Id, Description FROM Opportunity WHERE Id = :testOpportunity.Id];
        System.assertEquals('Updated Description', updatedOpportunity.Description);
    }
}