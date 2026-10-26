@isTest
public class UpdateNumberOfCasesTest {
    @isTest
    static void testCaseTrigger() {
        // Create an Account
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        // Verify initial state
        acc = [SELECT Id, Number_of_Cases__c FROM Account WHERE Id = :acc.Id];
        Decimal initialCaseCount = acc.Number_of_Cases__c == null ? 0 : acc.Number_of_Cases__c;
        System.assertEquals(0, initialCaseCount, 'Initial case count should be 0');

        // Create Cases related to the Account
        Case case1 = new Case(
            Subject = 'Test Case 1',
            AccountId = acc.Id
        );
        Case case2 = new Case(
            Subject = 'Test Case 2',
            AccountId = acc.Id
        );
        insert new List<Case>{case1, case2};

        // Verify case count after insert
        acc = [SELECT Id, Number_of_Cases__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, acc.Number_of_Cases__c, 'Case count should be 2 after insert');

        // Update a Case
        case1.Subject = 'Updated Case 1';
        update case1;

        // Verify case count remains the same after update
        acc = [SELECT Id, Number_of_Cases__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, acc.Number_of_Cases__c, 'Case count should remain 2 after update');
    }

    @isTest
    static void testCaseUpdateWithAccountChange() {
        // Create two Accounts
        Account acc1 = new Account(Name = 'Test Account 1');
        Account acc2 = new Account(Name = 'Test Account 2');
        insert new List<Account>{acc1, acc2};

        // Create a Case related to the first Account
        Case caseRecord = new Case(
            Subject = 'Test Case',
            AccountId = acc1.Id
        );
        insert caseRecord;

        // Verify initial state
        acc1 = [SELECT Id, Number_of_Cases__c FROM Account WHERE Id = :acc1.Id];
        acc2 = [SELECT Id, Number_of_Cases__c FROM Account WHERE Id = :acc2.Id];
        Decimal initialAcc1CaseCount = acc1.Number_of_Cases__c == null ? 0 : acc1.Number_of_Cases__c;
        Decimal initialAcc2CaseCount = acc2.Number_of_Cases__c == null ? 0 : acc2.Number_of_Cases__c;
        System.assertEquals(1, initialAcc1CaseCount, 'Account 1 case count should be 1');
        System.assertEquals(0, initialAcc2CaseCount, 'Account 2 case count should be 0');

        // Update the Case to relate it to the second Account
        caseRecord.AccountId = acc2.Id;
        update caseRecord;

        // Verify case counts after update
        acc1 = [SELECT Id, Number_of_Cases__c FROM Account WHERE Id = :acc1.Id];
        acc2 = [SELECT Id, Number_of_Cases__c FROM Account WHERE Id = :acc2.Id];
        System.assertEquals(0, acc1.Number_of_Cases__c, 'Account 1 case count should be 0 after update');
        System.assertEquals(1, acc2.Number_of_Cases__c, 'Account 2 case count should be 1 after update');
    }

    @isTest
    static void testCaseTriggerNoAccount() {
        // Create a Case without an Account
        Case caseRecord = new Case(
            Subject = 'Test Case'
        );
        insert caseRecord;

        // Verify no related Account update
        // Since the Case has no Account, the trigger should not attempt to update any Account
        // We will not assert here as no Account should be affected
    }
}