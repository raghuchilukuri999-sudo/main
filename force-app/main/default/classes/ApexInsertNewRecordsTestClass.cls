@isTest
private class ApexInsertNewRecordsTestClass {
    @isTest
    private static void unittest1() {
        // Set up the test data
        // Create an Account such that you can give that id in the contact record
        Account acc = new Account();
        acc.Name = 'Amazon';
        acc.NumberOfEmployees = 455666;
        acc.AnnualRevenue = 62022232.0;
        acc.Ownership = 'Private';
        acc.Industry = 'Technology';
        acc.Website = 'www.Amazon.com';
        
        // Insert the account
        insert acc;
        
        // Creating a contact without providing both email and phone
        Contact con = new Contact();
        con.FirstName = 'Marc';
        con.LastName = 'Benioff';
        con.AccountId = acc.Id;
        con.Title = 'CEO';
        con.MobilePhone = '';
        con.Email = '';
        
        // Insert contact which will call the trigger
        try {
            insert con;
        } catch (DmlException e) {
            System.debug('=== The Error Message is === ' + e.getMessage());
            // Check if the error message you defined in this test class contains the same error message that you given in the trigger
            System.assertEquals(true, e.getMessage().contains('you cannot create a contact without phone and email'));
        }
    }
    
    @isTest
    private static void unittest2() {
        // Set up the test data
        // Create an Account such that you can give that id in the contact record
        Account acc2 = new Account();
        acc2.Name = 'Accenture';
        acc2.NumberOfEmployees = 455666;
        acc2.AnnualRevenue = 62022232.0;
        acc2.Ownership = 'Private';
        acc2.Industry = 'Technology';
        acc2.Website = 'www.Accenture.com';
        
        // Insert the account
        insert acc2;
        
        // Creating a contact by providing phone but not email
        Contact con2 = new Contact();
        con2.FirstName = 'Mike';
        con2.LastName = 'David';
        con2.AccountId = acc2.Id;
        con2.Title = 'CEO';
        con2.MobilePhone = '7867664634';
        con2.Email = '';
        
        // Insert contact which will call the trigger
        try {
            insert con2;
        } catch (DmlException e) {
            System.debug('=== The Error Message is === ' + e.getMessage());
            // Check if the error message you defined in this test class contains the same error message that you given in the trigger
            System.assertEquals(true, e.getMessage().contains('you cannot create a contact without phone and email'));
        }
    }
    
    @isTest
    private static void unittest3() {
        // Set up the test data
        // Create an Account such that you can give that id in the contact record
        Account acc3 = new Account();
        acc3.Name = 'Zoho';
        acc3.NumberOfEmployees = 455666;
        acc3.AnnualRevenue = 62022232.0;
        acc3.Ownership = 'Private';
        acc3.Industry = 'Technology';
        acc3.Website = 'www.zoho.com';
        
        // Insert the account
        insert acc3;
        
        // Creating a contact by providing email but not phone
        Contact con3 = new Contact();
        con3.FirstName = 'Michael';
        con3.LastName = 'Starc';
        con3.AccountId = acc3.Id;
        con3.Title = 'CEO';
        con3.MobilePhone = '';
        con3.Email = 'MikeDavid45465@gmail.com';
        
        // Insert contact which will call the trigger
        try {
            insert con3;
        } catch (DmlException e) {
            System.debug('=== The Error Message is === ' + e.getMessage());
            // Check if the error message you defined in this test class contains the same error message that you given in the trigger
            System.assertEquals(true, e.getMessage().contains('you cannot create a contact without phone and email'));
        }
    }
}