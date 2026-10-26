public class DeleteClosedCasesSchedulerClass implements schedulable {
    
    public void execute(schedulablecontext sc){
        //call the DeleteClosedCasesSchedulerHandlerClass Method Here so as To schedule the Deletion Of closed Cases whose Closeddate Has Already passed
        //100 days ago and stored The Deleted cases In The caseArchive Object
        DeleteClosedCaseSchedulerHandlerClass.deleteclosedcases();
    }

}