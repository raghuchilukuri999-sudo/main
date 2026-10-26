@isTest
private class DuplicateAccountNameValidate {
    @isTest
    private static void unitTest() {
        // Inserting the first account
        Account acc1 = new Account();
        acc1.Name = 'Amazon';
        
        // Insert acc1
        insert acc1;

        // Attempt to insert a second account with the same name
        Account acc2 = new Account();
        acc2.Name = 'Amazon';

        // Insert acc2 and expect a DML exception
        try {
            insert acc2;
            // If no exception is thrown, the test should fail
            System.assert(false, 'Expected a DMLException to be thrown due to duplicate account name.');
        } catch (DmlException e) {
            System.debug('The error message is: ' + e.getMessage());
            // Check if the error message contains the expected text
            System.assertEquals(true, e.getMessage().contains('The name of this new account is matching with an existing account'));
        }
    }
}