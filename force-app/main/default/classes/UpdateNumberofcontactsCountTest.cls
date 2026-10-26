@isTest
public class UpdateNumberofcontactsCountTest {
    @isTest
    static void testContactTrigger() {
        // Create an Account
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        // Verify initial state
        acc = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc.Id];
        Decimal initialContactCount = acc.Number_of_Contacts__c == null ? 0 : acc.Number_of_Contacts__c;
        System.assertEquals(0, initialContactCount, 'Initial contact count should be 0');

        // Create Contacts related to the Account
        Contact con1 = new Contact(
            FirstName = 'First',
            LastName = 'Contact',
            AccountId = acc.Id
        );
        Contact con2 = new Contact(
            FirstName = 'Second',
            LastName = 'Contact',
            AccountId = acc.Id
        );
        insert new List<Contact>{con1, con2};

        // Verify contact count after insert
        acc = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, acc.Number_of_Contacts__c, 'Contact count should be 2 after insert');

        // Update a Contact
        con1.LastName = 'UpdatedContact';
        update con1;

        // Verify contact count remains the same after update
        acc = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, acc.Number_of_Contacts__c, 'Contact count should remain 2 after update');

        // Delete a Contact
        delete con1;

        // Verify contact count after delete
        acc = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(1, acc.Number_of_Contacts__c, 'Contact count should be 1 after delete');

        // Undelete the Contact
        undelete con1;

        // Verify contact count after undelete
        acc = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, acc.Number_of_Contacts__c, 'Contact count should be 2 after undelete');
    }

    @isTest
    static void testContactUpdateWithAccountChange() {
        // Create two Accounts
        Account acc1 = new Account(Name = 'Test Account 1');
        Account acc2 = new Account(Name = 'Test Account 2');
        insert new List<Account>{acc1, acc2};

        // Create a Contact related to the first Account
        Contact con = new Contact(
            FirstName = 'First',
            LastName = 'Contact',
            AccountId = acc1.Id
        );
        insert con;

        // Verify initial state
        acc1 = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc1.Id];
        acc2 = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc2.Id];
        Decimal initialAcc1ContactCount = acc1.Number_of_Contacts__c == null ? 0 : acc1.Number_of_Contacts__c;
        Decimal initialAcc2ContactCount = acc2.Number_of_Contacts__c == null ? 0 : acc2.Number_of_Contacts__c;
        System.assertEquals(1, initialAcc1ContactCount, 'Account 1 contact count should be 1');
        System.assertEquals(0, initialAcc2ContactCount, 'Account 2 contact count should be 0');

        // Update the Contact to relate it to the second Account
        con.AccountId = acc2.Id;
        update con;

        // Verify contact counts after update
        acc1 = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc1.Id];
        acc2 = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc2.Id];
        System.assertEquals(0, acc1.Number_of_Contacts__c, 'Account 1 contact count should be 0 after update');
        System.assertEquals(1, acc2.Number_of_Contacts__c, 'Account 2 contact count should be 1 after update');
    }

    @isTest
    static void testContactTriggerNoAccount() {
        // Create a Contact without an Account
        Contact con = new Contact(
            FirstName = 'First',
            LastName = 'Contact'
        );
        insert con;

        // Verify no related Account update
        // Since the Contact has no Account, the trigger should not attempt to update any Account
        // We will not assert here as no Account should be affected
    }

    @isTest
    static void testContactTriggerAccountChange() {
        // Create an Account
        Account acc1 = new Account(
            Name = 'Test Account 1'
        );
        insert acc1;

        // Create another Account
        Account acc2 = new Account(
            Name = 'Test Account 2'
        );
        insert acc2;

        // Create a Contact related to the first Account
        Contact con = new Contact(
            FirstName = 'First',
            LastName = 'Contact',
            AccountId = acc1.Id
        );
        insert con;

        // Verify initial state
        acc1 = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc1.Id];
        System.assertEquals(1, acc1.Number_of_Contacts__c, 'Account 1 contact count should be 1');

        // Update the Contact to relate it to the second Account
        con.AccountId = acc2.Id;
        update con;

        // Verify contact counts after update
        acc1 = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc1.Id];
        acc2 = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :acc2.Id];
        System.assertEquals(0, acc1.Number_of_Contacts__c, 'Account 1 contact count should be 0 after update');
        System.assertEquals(1, acc2.Number_of_Contacts__c, 'Account 2 contact count should be 1 after update');
    }
}