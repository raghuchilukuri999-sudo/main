public class DailyLeaveRequestBatchScheduler implements Schedulable {
    public void execute(SchedulableContext sc) {
        LeaveRequestBatch batch = new LeaveRequestBatch();
        Database.executeBatch(batch, 200); // Adjust the batch size as needed
    }
}