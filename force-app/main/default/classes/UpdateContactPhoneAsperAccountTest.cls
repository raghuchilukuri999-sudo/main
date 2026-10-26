@isTest
public class UpdateContactPhoneAsperAccountTest {
    
    @testSetup
    static void setupTestData() {
        // Create a test account
        Account testAccount = new Account(Name = 'Test Account', Phone = '1234567890');
        insert testAccount;

        // Create test contacts related to the account
        List<Contact> testContacts = new List<Contact>();
        for (Integer i = 0; i < 5; i++) {
            testContacts.add(new Contact(FirstName = 'Test', LastName = 'Contact' + i, Phone = '1234567890', AccountId = testAccount.Id));
        }
        insert testContacts;
    }

    @isTest
    static void testUpdateContactPhoneAsperAccount() {
        // Fetch the test account
        Account testAccount = [SELECT Id, Phone FROM Account WHERE Name = 'Test Account' LIMIT 1];

        // Update the phone number of the test account
        testAccount.Phone = '0987654321';
        update testAccount;

        // Fetch the related contacts
        List<Contact> updatedContacts = [SELECT Id, Phone, AccountId FROM Contact WHERE AccountId = :testAccount.Id];

        // Assert that all related contacts have the updated phone number
        for (Contact con : updatedContacts) {
            System.assertEquals('0987654321', con.Phone, 'Contact phone number should match the updated account phone number.');
        }
    }
}