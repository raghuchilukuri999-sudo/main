public class DeleteLeadsbatchApexClassSchedule implements schedulable {
    
    //We Need To schedule The Deletion Of Lead Records Whose Status Is closed-NotCoverted for every month  we cant dircetly do it with apex or with ui 
    //so we use mix of both i.e;
    //schedulable class and its method to do That Along With this
    //we need To go To ui For Scheduling this Apex Class As Per Our Requirement
    
    public void execute(schedulablecontext sc){
        
        //in Schedulable Class We Have Only One Method I.e Execute
        //In schedulable Apex Class We Do Nothing But Calling The Main Apex Class Same As We Do In The Debugging Page
        //since Debugging Page Cant Be saved ANd Used In Ui Fr Scheduling We Use This Class And We Call The Main APex Methd Into This Class And
        //This Will Be Called From Ui for Scheduling
        
        //calling The DeleteLeadsbatchApexClass by creating an Instance
        DeleteLeadsbatchApexClass batchclassinstance = new DeleteLeadsbatchApexClass();

        //let The Batch Size Be 200
        // and batchclassinstance is our created instance
        id batchid = database.executebatch(batchclassinstance,200);
        
        
    }

}