@isTest
public class TestThis4BankAndAccount {

    @isTest
    public static void testBankAccountCreation() {
        // Create a mock Bank instance
        This4Bank bankInstance = new This4Bank('Bank of Apex');
        
        // Since we are using System.debug in constructors, we can check the debug logs to verify the output
        // Verify that the bank and account are correctly created by inspecting the logs.
        
        // Here, you could also use assertions if the logic had return values
        // But in this case, we are primarily checking the debug output
        
        // Example: Assert the bank name to verify creation (optional)
        System.assertEquals('Bank of Apex', bankInstance.bankName);
    }
}