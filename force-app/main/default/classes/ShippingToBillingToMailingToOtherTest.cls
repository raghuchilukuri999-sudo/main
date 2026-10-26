@isTest
public class ShippingToBillingToMailingToOtherTest {
    
    @isTest
    public static void testShippingToMailingAndOtherFields() {
        
        // Step 1: Create and insert Account record
        Account acc = new Account();
        acc.Name = 'HariRam';
        acc.ShippingCity = 'Kasi';
        acc.ShippingState = 'Varanasi';
        acc.ShippingStreet = 'Amg';
        insert acc;
        
        // Step 2: Create and insert related Contact record
        Contact con = new Contact();
        con.LastName = 'Vishwanadh';
        con.AccountId = acc.Id;  // Related to the account created
        insert con;
        
        // Step 3: Query back the Contact to verify the Mailing and Other addresses are updated
        Contact contactResult = [SELECT MailingStreet, MailingCity, MailingState, OtherStreet, OtherCity, OtherState 
                                 FROM Contact 
                                 WHERE Id = :con.Id];
        
        // Step 4: Assertions to check if the Mailing and Other fields were updated from Shipping fields
        System.assertEquals('Amg', contactResult.MailingStreet, 'MailingStreet should be copied from ShippingStreet');
        System.assertEquals('Kasi', contactResult.MailingCity, 'MailingCity should be copied from ShippingCity');
        System.assertEquals('Varanasi', contactResult.MailingState, 'MailingState should be copied from ShippingState');
        
        System.assertEquals('Amg', contactResult.OtherStreet, 'OtherStreet should be copied from MailingStreet');
        System.assertEquals('Kasi', contactResult.OtherCity, 'OtherCity should be copied from MailingCity');
        System.assertEquals('Varanasi', contactResult.OtherState, 'OtherState should be copied from MailingState');
    }
    
    @isTest
    public static void testBulkScenario() {
        
        // Step 1: Create and insert multiple Account records
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            accList.add(new Account(
                Name = 'Test Account ' + i,
                ShippingCity = 'City ' + i,
                ShippingState = 'State ' + i,
                ShippingStreet = 'Street ' + i
            ));
        }
        insert accList;
        
        // Step 2: Create related Contacts for each Account
        List<Contact> contactList = new List<Contact>();
        for (Account acc : accList) {
            contactList.add(new Contact(
                LastName = 'Test Contact',
                AccountId = acc.Id
            ));
        }
        insert contactList;
        
        // Step 3: Query back all contacts to ensure they were updated
        List<Contact> contactResults = [SELECT MailingStreet, MailingCity, MailingState, OtherStreet, OtherCity, OtherState 
                                        FROM Contact 
                                        WHERE AccountId IN :accList];
        
        // Step 4: Assertions to verify the Mailing and Other fields are correctly populated
        for (Contact con : contactResults) {
            System.assertNotEquals(null, con.MailingStreet, 'MailingStreet should be populated');
            System.assertNotEquals(null, con.MailingCity, 'MailingCity should be populated');
            System.assertNotEquals(null, con.MailingState, 'MailingState should be populated');
            System.assertNotEquals(null, con.OtherStreet, 'OtherStreet should be populated');
            System.assertNotEquals(null, con.OtherCity, 'OtherCity should be populated');
            System.assertNotEquals(null, con.OtherState, 'OtherState should be populated');
        }
    }
}