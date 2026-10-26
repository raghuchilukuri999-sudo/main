public class DeleteClosedCaseSchedulerHandlerClass {
    
    public static void deleteclosedcases(){
        date cutoffdate = date.Today().addDays(-100);
        
        //create a list to store the deleted closed cases in the case archive object
        list<case_Archive__c> caseArchivelist = new list<case_Archive__c>();
        
        //fetch The Cases Which are Closed And whose Closeddate has Already passed 100 days ago
        list<case> closedcases = [select id,casenumber,Accountid,contactid,ownerid,description,status,priority,subject from case where status = 'closed' And closedDate <= :cutoffdate];
        
        //iterate Through This Fetched cases
        for(case cs : closedcases){
            //create a Record In The Case_Archive__c Object Of The Above Fetched Cases(i.e for each closed case)
            case_Archive__c caseArchive = new case_Archive__c();
             CaseArchive.Name = cs.caseNumber;
             CaseArchive.Account_of_Case_Archive__c = cs.Accountid;
             CaseArchive.Contact_of_Case_Archives__c = cs.contactid;
             CaseArchive.Case_Archive_priority__c = cs.priority;
             CaseArchive.Case_Archive_status__c = cs.status;
             CaseArchive.case_Archive_Subject__c = cs.subject;
             CaseArchive.case_Archive_Description__c = cs.Description;
            
            //Add all the CaseArchive Records To The CaseArchive List
            caseArchivelist.add(caseArchive);
        }
        
        //check if there are any records In The CaseArchivelist
        if(!caseArchivelist.IsEmpty()){
            insert caseArchivelist;
        }
        
        //delete original cases that are passed the closed date 100 days before and that are in case object
        if(!closedcases.isEmpty()){
            delete closedcases;
        }
    }


}