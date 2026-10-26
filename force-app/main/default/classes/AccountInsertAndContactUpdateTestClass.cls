@isTest
private class AccountInsertAndContactUpdateTestClass {
    @isTest
    private static void unittest() {
        // Create a new Contact
        Contact con = new Contact();
        con.LastName = 'Swaroop';
        insert con;
        
        // Create a new Account
        Account acc = new Account();
        acc.Name = con.LastName;
        acc.Website = 'www.' + con.LastName + '.com';
        insert acc;
        
        // Update Contact with the AccountId
        for (Contact contact : [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE AccountId = null AND LastName = :acc.Name]) {
            contact.AccountId = acc.Id;
            update contact;
        }
    }
}