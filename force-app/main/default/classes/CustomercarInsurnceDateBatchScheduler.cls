public class CustomercarInsurnceDateBatchScheduler implements Schedulable {
    
    public void execute(SchedulableContext sc) {
        // Create an instance of the batch class
        CustomercarInsurnceDateBatchApex batchInstance = new CustomercarInsurnceDateBatchApex();
        
        // Execute the batch with a batch size of 200
        Database.executeBatch(batchInstance, 200);
    }
    
}