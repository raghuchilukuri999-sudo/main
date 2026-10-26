@isTest
public class CantDeleteAccountWithContactsTest {
    @testSetup
    static void setup() {
        // Create an account
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        // Create a contact associated with the account
        Contact con = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            Email = 'john.doe@example.com',
            AccountId = acc.Id
        );
        insert con;
    }
    
    @isTest
    static void testPreventDeletionWithContact() {
        // Query the account and contact
        Account acc = [SELECT Id FROM Account WHERE Name = 'Test Account'];
        Contact con = [SELECT Id FROM Contact WHERE AccountId = :acc.Id];
        
        // Try to delete the account
        try {
            delete acc;
            System.assert(false, 'Expected an error when deleting the account.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Cannot delete account'), 'Expected a specific error message.');
        }
    }
    
    @isTest
    static void testAllowDeletionWithoutContact() {
        // Create a new account without a contact
        Account acc = new Account(Name = 'Test Account 2');
        insert acc;
        
        // Delete the account
        delete acc;
        
        // Verify that the account is deleted
        System.assert([SELECT Id FROM Account WHERE Id = :acc.Id].isEmpty());
    }
    
    @isTest
    static void testPreventDeletionWithMultipleContacts() {
        // Create multiple contacts associated with the account
        Contact con1 = new Contact(
            FirstName = 'Jane',
            LastName = 'Doe',
            Email = 'jane.doe@example.com',
            AccountId = [SELECT Id FROM Account WHERE Name = 'Test Account'].Id
        );
        insert con1;
        
        Contact con2 = new Contact(
            FirstName = 'Bob',
            LastName = 'Smith',
            Email = 'bob.smith@example.com',
            AccountId = [SELECT Id FROM Account WHERE Name = 'Test Account'].Id
        );
        insert con2;
        
        // Try to delete the account
        try {
            delete [SELECT Id FROM Account WHERE Name = 'Test Account'];
            System.assert(false, 'Expected an error when deleting the account.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Cannot delete account'), 'Expected a specific error message.');
        }
    }
}