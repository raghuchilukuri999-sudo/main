public class shareCustDetailsToEmpBatchApex implements database.batchable<sobject>{
    
    public database.querylocator start(database.batchablecontext bc){
        //fetch the customer Records Whose Whose affiliated Marketing Team Started Today and in those Marketing Teams Have Employee Field should Not Be Empty
        string query = 'select id,Name,Supporting_Marketing_Team__r.Marketing_Team_Established_Date__c,Supporting_Marketing_Team__r.Employee_In_the_Marketing_Field__c From customer__c where Supporting_Marketing_Team__r.Marketing_Team_Established_Date__c < Today And Supporting_Marketing_Team__r.Employee_In_the_Marketing_Field__c <> Null';
        
        return database.getquerylocator(query);
    }
    
    public void execute(database.batchablecontext bc,list<customer__c> ProcessedRecordsInStartMethod){
        //creating a set to store The Employee__c ids
        set<id> Employeeids = new set<id>();
        
        //creating a set To store The Employee Emails as String
        set<string> EmployeeEmails = new set<string>();
        
        //creating a map to store The Employee Ids In The Key Of The map And Employee Records In The Value Of The Map
        map<id,Employee__c> EmployeeMap = new map<id,Employee__c>();
        
        //creating a map to store the Email Ids Of those users whose Email Ids Matches with Email Ids Of The Employee in the key as a string and 
        //user records in the value of the map
        map<string,user> userMap = new map<string,user>();
        
        //now Iterate Through The Processed Records of customers and add The marketing Team Associated Employees To The Employeeids set
        for(customer__c cust:ProcessedRecordsInStartMethod){
            Employeeids.add(cust.Supporting_Marketing_Team__r.Employee_In_the_Marketing_Field__c);
        }
        
        //Fetch The Employee Records of those who are in Employeeids Set For adding Employee Email To The EmployeeEmails set and Emailid and Employee Records To the EmployeeMap
        for(Employee__c Empfetch : [select id,Name,	Employee_Email__c From Employee__c where id in : Employeeids]){
            EmployeeEmails.add(Empfetch.Employee_Email__c);
            EmployeeMap.put(Empfetch.Id,Empfetch);
        }
        
        //Fetch The User Records Of Those Whose Emails Matches with The Employee Emails amd Add Them To The userMap 
        for(user userfetch : [select id,Name,Email From User Where Email in : EmployeeEmails]){
            UserMap.put(userfetch.Email,userfetch);
        }
        
        //create a list To store The customershare Object Records Becz The customerShare Object is 
        //auto created by The Salesforce and There will be Some required Fields which Have To give Ourselves
        list<customer__share> custsharelist = new list<customer__share>();
        
        //Now For each Customer Record There should Be A Share Record That Needs To Auto Generated 
        //and For Those Auto generated Share Records The Required Values Should Be Filled
        for(customer__c custiterate : ProcessedRecordsInStartMethod){
            //creating an instnace to store the customer__share Records Required Field Values
            customer__share custsharecreate = new customer__share();
            custsharecreate.AccessLevel = 'Read';
            custsharecreate.ParentId = custiterate.id;
            custsharecreate.RowCause = 'Manual';
            custsharecreate.UserOrGroupId = userMap.get(EmployeeMap.get(custiterate.Supporting_Marketing_Team__r.Employee_In_the_Marketing_Field__c).Employee_Email__c).id;
            //Add Each custShareCreate Records To The custsharelist
            custsharelist.add(custsharecreate);   
        }
        
        //check if there are any records In The CustSharelist and insert The custsharelist
        if(!custsharelist.isEmpty()){
            insert custsharelist;
        }
       
    }
    
    public void finish(database.batchablecontext bc){
        //lets keep This Finish Method as Optinal
    }
    
    

}