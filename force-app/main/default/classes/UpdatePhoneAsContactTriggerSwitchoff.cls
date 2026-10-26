@isTest
private class UpdatePhoneAsContactTriggerSwitchoff {
    
    @isTest
    private static void unittest() {
        // Create and insert an account
        Account acc = new Account();
        acc.Name = 'Manchivadu';
        insert acc;
        
        // Create and insert a contact associated with the account
        Contact con = new Contact();
        con.LastName = 'Maha';
        con.Phone = '786798689';
        con.AccountId = acc.Id;
        insert con;
        
        //checking If the Contact is Inserted 
        Contact con1 = [SELECT Id, Phone, AccountId FROM Contact WHERE Id = :con.Id];
        System.assertEquals('786798689', con1.Phone);
        
        // Update the account phone number
        acc.Phone = '546863636';
        update acc;
        
        // Fetch the updated contact to check if the phone number was updated
        Contact con2 = [SELECT Id, Phone, AccountId FROM Contact WHERE Id = :con.Id];
        
        // Assert that the contact's phone number is updated to match the account's phone number
        System.assertEquals('546863636', con2.Phone);
    }
}