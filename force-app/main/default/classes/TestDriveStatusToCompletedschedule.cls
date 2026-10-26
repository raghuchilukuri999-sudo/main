public class TestDriveStatusToCompletedschedule implements schedulable {
    
    public void execute(schedulablecontext sc){
        //calling the TestDriveStatusToCompletedBatchApex by creating a new instance
        TestDriveStatusToCompletedBatchApex testDriveinstance = new TestDriveStatusToCompletedBatchApex();


         //testDriveinstance is the instance That we created
       //and lets take The batch size as 200
      id batchid = database.executebatch(testDriveinstance,200);
        
    }

}