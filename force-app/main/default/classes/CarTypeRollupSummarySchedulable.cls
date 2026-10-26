public class CarTypeRollupSummarySchedulable implements Schedulable {
    
    public void execute(SchedulableContext sc) {
        // Define the job name
        String jobName = 'SchedulableCarTypeRollupSummaryBatchApex';
        
        // Create an instance of the batch class
        CarTypeRollupSummaryBatchApex batchClassInstance = new CarTypeRollupSummaryBatchApex();
        
        // Schedule the batch job
        Database.executeBatch(batchClassInstance, 200);
    }
    
    // Method to schedule the job with a cron expression
    public static void scheduleJob() {
        // Define the cron expression (runs at 30 minutes past every hour)
        String cronExpression = '0 30 * * * ?';
        
        // Schedule the job using the cron expression
        System.schedule('CarTypeRollupSummarySchedulableJob', cronExpression, new CarTypeRollupSummarySchedulable());
    }
}