@isTest
public class CaseCountTriggerTest {
    
    @isTest
    static void testCaseCountTrigger() {
        // Create test data
        Account acc1 = new Account(Name = 'Test Account 1');
        Account acc2 = new Account(Name = 'Test Account 2');
        insert new List<Account>{acc1, acc2};
        
        // Insert cases
        Case case1 = new Case(Status = 'Open', AccountId = acc1.Id);
        Case case2 = new Case(Status = 'Closed', AccountId = acc1.Id);
        Case case3 = new Case(Status = 'Open', AccountId = acc2.Id);
        insert new List<Case>{case1, case2, case3};
        
        // Verify initial counts
        acc1 = [SELECT No_of_open_Cases__c, No_of_closed_Cases__c, Total_No_of_cases__c FROM Account WHERE Id = :acc1.Id];
        acc2 = [SELECT No_of_open_Cases__c, No_of_closed_Cases__c, Total_No_of_cases__c FROM Account WHERE Id = :acc2.Id];
        
        System.assertEquals(1, acc1.No_of_open_Cases__c);
        System.assertEquals(1, acc1.No_of_closed_Cases__c);
        System.assertEquals(2, acc1.Total_No_of_cases__c);
        
        System.assertEquals(1, acc2.No_of_open_Cases__c);
        System.assertEquals(0, acc2.No_of_closed_Cases__c);
        System.assertEquals(1, acc2.Total_No_of_cases__c);
        
        // Update a case status
        case1.Status = 'Closed';
        update case1;
        
        // Verify updated counts
        acc1 = [SELECT No_of_open_Cases__c, No_of_closed_Cases__c, Total_No_of_cases__c FROM Account WHERE Id = :acc1.Id];
        System.assertEquals(0, acc1.No_of_open_Cases__c);
        System.assertEquals(2, acc1.No_of_closed_Cases__c);
        System.assertEquals(2, acc1.Total_No_of_cases__c);
        
        // Delete a case
        delete case2;
        
        // Verify counts after deletion
        acc1 = [SELECT No_of_open_Cases__c, No_of_closed_Cases__c, Total_No_of_cases__c FROM Account WHERE Id = :acc1.Id];
        System.assertEquals(0, acc1.No_of_open_Cases__c);
        System.assertEquals(1, acc1.No_of_closed_Cases__c);
        System.assertEquals(1, acc1.Total_No_of_cases__c);
        
        // Undelete a case
        undelete case2;
        
        // Verify counts after undeletion
        acc1 = [SELECT No_of_open_Cases__c, No_of_closed_Cases__c, Total_No_of_cases__c FROM Account WHERE Id = :acc1.Id];
        System.assertEquals(0, acc1.No_of_open_Cases__c);
        System.assertEquals(2, acc1.No_of_closed_Cases__c);
        System.assertEquals(2, acc1.Total_No_of_cases__c);
    }
    
}