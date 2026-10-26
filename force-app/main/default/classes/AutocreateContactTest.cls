@isTest
public class AutocreateContactTest {

    // Test method to cover trigger functionality
    @isTest
    static void testAutocreateContactTrigger() {
        // Create test data: Profiles
        Profile testProfile = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];

        // Create test data: Accounts
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name = 'Test Account 1'));
        testAccounts.add(new Account(Name = 'Test Account 2'));
        insert testAccounts;

        // Create test data: Users with associated Accounts
        List<User> testUsers = new List<User>();
        testUsers.add(new User(
            FirstName = 'John',
            LastName = 'Doe',
            Email = 'johndoe@example.com',
            Username = 'johndoe@example.com',
            CompanyName = 'Test Account 1',  // Associate with Test Account 1
            Alias = 'jdoe',
            TimeZoneSidKey = 'America/Los_Angeles',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            ProfileId = testProfile.Id,
            LanguageLocaleKey = 'en_US'
        ));
        testUsers.add(new User(
            FirstName = 'Jane',
            LastName = 'Smith',
            Email = 'janesmith@example.com',
            Username = 'janesmith@example.com',
            CompanyName = 'Test Account 2',  // Associate with Test Account 2
            Alias = 'jsmith',
            TimeZoneSidKey = 'America/Los_Angeles',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            ProfileId = testProfile.Id,
            LanguageLocaleKey = 'en_US'
        ));
        insert testUsers;

        // Query created contacts
        List<Contact> createdContacts = [SELECT Id, FirstName, LastName, Email, AccountId FROM Contact];

        // Assertions to verify trigger functionality
        System.assertEquals(2, createdContacts.size(), 'Expected 2 Contacts to be created');

        // Verify Contact details and Account associations
        Map<String, Id> accountNameToIdMap = new Map<String, Id>();
        for (Account acc : testAccounts) {
            accountNameToIdMap.put(acc.Name, acc.Id);
        }

        for (Contact con : createdContacts) {
            User relatedUser = null;
            for (User u : testUsers) {
                if (u.Email == con.Email) {
                    relatedUser = u;
                    break;
                }
            }
            System.assertNotEquals(null, relatedUser, 'Related User not found for Contact');

            System.assertEquals(relatedUser.FirstName, con.FirstName, 'Contact First Name does not match User');
            System.assertEquals(relatedUser.LastName, con.LastName, 'Contact Last Name does not match User');
            System.assertEquals(relatedUser.Email, con.Email, 'Contact Email does not match User');
            System.assertEquals(accountNameToIdMap.get(relatedUser.CompanyName), con.AccountId, 'Contact not associated with correct Account');
        }
    }
}