public class TestDriveStatusToCompletedBatchApex implements Database.Batchable<sobject> {
    
    public database.querylocator start(database.batchablecontext bc){
        
        //fetch The Customer Records Whom You Want To Process
        string query = 'select id,Name,car_Test_Drive_Start_Date_On__c,car_Test_Drive_ending_on__c,	car_Test_Drive_End_Date_On__c,Customer_Test_Drive_Status__c  From Customer__c where car_Test_Drive_End_Date_On__c < Today car_Test_Drive_ending_on__c < Today And Customer_Test_Drive_Status__c <> \'completed\'';
        
        return database.getquerylocator(query);
    }
    
    public void execute(database.batchablecontext bc, list<customer__C> ProcessedCustomerRecords){
        
        //create a list To store The Updating Records
        list<customer__c> custlist = new list<customer__c>();
        
        //create an iteration such That All The ProcessedRecords Should Get Covered For Updation
        for(customer__C cust : ProcessedCustomerRecords){
            
            //Mark Or mention The Upadte That You Wanna Make To The Processed Records
            cust.Customer_Test_Drive_Status__c = 'completed';
            
            //Add The changes Marked Records To The List Such That it makes Bulk Updation easy
            custlist.add(cust);
            
        }
        
        //now check that if our adding is succesful or not using isEmpty method
        if(!custlist.IsEmpty()){
            update custlist;
        }
    }
    
    public void finish(database.batchablecontext bc){
        //since there is no postprocess operations like sending emails lets keep this Optional
    }

}