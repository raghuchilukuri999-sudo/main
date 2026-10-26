public class ExpireContractsBatchScheduler implements schedulable{
    
    public void execute(schedulablecontext sc){
        //calling The Batch Class Inside The schedulable Class
        //create an Instance of The Batch Class 
        ExpireContractsBatch batchclassobject = new ExpireContractsBatch();
         //call The batch class
        //using executebatch Method in which InstanceName and Size 
        id Batchid = database.executebatch(batchclassobject,200);
        
    }
    
    

}