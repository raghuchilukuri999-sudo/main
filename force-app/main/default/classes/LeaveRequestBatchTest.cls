@isTest
public class LeaveRequestBatchTest {
    
    @testSetup
    static void setup() {
        List<Employee__c> employees = new List<Employee__c>();
        List<Leave_Request__c> leaveRequests = new List<Leave_Request__c>();
        
        // Creating 400 Employee records
        for (Integer i = 0; i < 400; i++) {
            employees.add(new Employee__c(Name = 'Employee ' + i));
        }
        
        insert employees;
        
        // Creating 200 test records for No_Of_Days_Of_Leave_Applied__c > 3 and <= 5
        for (Integer i = 0; i < 200; i++) {
            Date startDate = Date.today().addDays(-4);
            Date endDate = Date.today();
            
            leaveRequests.add(new Leave_Request__c(
                Leave_Reason__c = 'Sick Leave',
                Leave_Start_Date__c = startDate,
                Leave_End_Date__c = endDate,
                Employee_Leave_Request__c = employees[i].Id
            ));
        }
        
        // Creating 200 test records for No_Of_Days_Of_Leave_Applied__c > 5
        for (Integer i = 200; i < 400; i++) {
            Date startDate = Date.today().addDays(-6);
            Date endDate = Date.today();
            
            leaveRequests.add(new Leave_Request__c(
                Leave_Reason__c = 'Sick Leave',
                Leave_Start_Date__c = startDate,
                Leave_End_Date__c = endDate,
                Employee_Leave_Request__c = employees[i].Id
            ));
        }
        
        insert leaveRequests;
    }
    
    @isTest
    static void testBatchExecution() {
        Test.startTest();
        
        // Execute the batch with a specific batch size
        LeaveRequestBatch batch = new LeaveRequestBatch();
        Database.executeBatch(batch, 400); // Set batch size to 400
        
        Test.stopTest();
        
        // Verify the results
        Leave_Request__c[] updatedRequests = [SELECT Id, Leave_Approval_Status__c, No_Of_Days_Of_Leave_Applied__c 
                                              FROM Leave_Request__c 
                                              WHERE Leave_Reason__c = 'Sick Leave'];
        
        for (Leave_Request__c request : updatedRequests) {
            Decimal noOfDays = request.No_Of_Days_Of_Leave_Applied__c;
            
            if (noOfDays > 5) {
                System.assertEquals('Rejected', request.Leave_Approval_Status__c);
            } else if (noOfDays > 3 && noOfDays <= 5) {
                System.assertEquals('cancelled', request.Leave_Approval_Status__c);
            } else {
                System.assertNotEquals('cancelled', request.Leave_Approval_Status__c);
                System.assertNotEquals('Rejected', request.Leave_Approval_Status__c);
            }
        }
    }
}