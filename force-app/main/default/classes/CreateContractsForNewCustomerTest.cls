@isTest
public class CreateContractsForNewCustomerTest {

    @isTest
    static void testCreateContractsForNewCustomer() {
        // Create test data: Accounts
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name = 'Test Account 1', Type = 'Prospect'));
        testAccounts.add(new Account(Name = 'Test Account 2', Type = 'Prospect'));
        testAccounts.add(new Account(Name = 'Test Account 3', Type = 'Customer-Direct'));
        testAccounts.add(new Account(Name = 'Test Account 4', Type = 'Customer-Channel'));
        insert testAccounts;

        // Create test data: Opportunities
        List<Opportunity> testOpportunities = new List<Opportunity>();
        // Associate Opportunities with relevant Accounts and set them to 'closedwon' stage
        testOpportunities.add(new Opportunity(Name = 'Test Opportunity 1', StageName = 'Closed Won', CloseDate = Date.today(), AccountId = testAccounts[0].Id));
        testOpportunities.add(new Opportunity(Name = 'Test Opportunity 2', StageName = 'Closed Won', CloseDate = Date.today(), AccountId = testAccounts[1].Id));
        testOpportunities.add(new Opportunity(Name = 'Test Opportunity 3', StageName = 'Closed Won', CloseDate = Date.today(), AccountId = testAccounts[2].Id));
        testOpportunities.add(new Opportunity(Name = 'Test Opportunity 4', StageName = 'Proposal', CloseDate = Date.today(), AccountId = testAccounts[3].Id)); // This should not create a contract
        insert testOpportunities;

        // Trigger the account update to change types
        testAccounts[0].Type = 'Customer-Direct';
        testAccounts[1].Type = 'Customer-Channel';
        update testAccounts;

        // Query created contracts
        List<Contract> createdContracts = [SELECT Id, AccountId, ContractTerm, StartDate, Status FROM Contract];

        // Assertions to verify trigger functionality
        System.assertEquals(2, createdContracts.size(), 'Expected 2 Contracts to be created');

        // Verify Contract details
        Map<Id, Account> accountIdToAccountMap = new Map<Id, Account>();
        for (Account acc : testAccounts) {
            accountIdToAccountMap.put(acc.Id, acc);
        }

        for (Contract con : createdContracts) {
            System.assertNotEquals(null, con.AccountId, 'Contract not associated with an Account');

            Account relatedAccount = accountIdToAccountMap.get(con.AccountId);
            System.assertNotEquals(null, relatedAccount, 'Related Account not found for Contract');

            System.assertEquals(12, con.ContractTerm, 'Contract Term should be 12 months');
            System.assertEquals('Draft', con.Status, 'Contract Status should be Draft');

            Date expectedStartDate = testOpportunities[0].CloseDate.addDays(7); // Start date is 7 days after Opportunity close date
            System.assertEquals(expectedStartDate, con.StartDate, 'Start Date does not match expected');
        }
    }
}