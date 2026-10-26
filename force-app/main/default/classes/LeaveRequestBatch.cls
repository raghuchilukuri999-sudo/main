public class LeaveRequestBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([
            SELECT Id, No_Of_Days_Of_Leave_Applied__c 
            FROM Leave_Request__c 
            WHERE Leave_Approval_Status__c = NULL
        ]);
    }

    public void execute(Database.BatchableContext BC, List<Leave_Request__c> scope) {
        for (Leave_Request__c request : scope) {
            Decimal noOfDays = request.No_Of_Days_Of_Leave_Applied__c;
            
            if (noOfDays > 5) {
                request.Leave_Approval_Status__c = 'Rejected';
            } else if (noOfDays > 3 && noOfDays <= 5) {
                request.Leave_Approval_Status__c = 'cancelled';
            }
        }
        update scope;
    }

    public void finish(Database.BatchableContext BC) {
        // Optional: Add any post-processing logic here
    }
}