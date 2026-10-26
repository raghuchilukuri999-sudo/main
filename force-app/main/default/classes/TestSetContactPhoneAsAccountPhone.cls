@isTest
private class TestSetContactPhoneAsAccountPhone {

    @isTest
    static void testContactPhoneUpdate() {
        // Create an Account
        Account testAccount = new Account(Name = 'Test Account', Phone = '123-456-7890');
        insert testAccount;

        // Create a Contact without a phone number
        Contact testContact = new Contact(LastName = 'Test Contact', AccountId = testAccount.Id,phone = testAccount.phone);
        insert testContact;

        // Verify that the contact phone is updated
        testContact = [SELECT Id, Phone FROM Contact WHERE Id = :testContact.Id];
        System.assertEquals(testAccount.Phone, testContact.Phone, 'Contact phone should match Account phone');
    }
}