@istest
private class testDriveStatusBatchapexUpdateTestClass {
    
    @Testsetup
    
    private static void TestSetupData(){
        
        //Firstly Creating a List To bulk insert The Records
        list<customer__C> custlist = new list<customer__C>();
        
        //Now A loop To auto create multiple Customer Records
        for(integer i=1;i<=200;i++){
            
            //creating an instance To create new Customers
            customer__C cust = new customer__C();
            
            cust.name = 'test cust'+i;
            cust.car_Test_Drive_Start_Date_On__c = date.newinstance(2024,03,02);
            cust.Customer_Test_Drive_Status__c = 'Inprogress';
            cust.Car_Type__r.Name = 'Kamandalam';
            
            //Add the Cust records To the List since inserting single single record is not that easy,timetaking and dml may exceed governor limts
            custlist.add(cust);
            
        }
        
        //check if the Adding is successful or not using isEmpty method
        if(!custlist.IsEmpty()){
            insert custlist;
        }
    }
    
    //Now The Actual Test Process 
    @istest
    
    private static Void ActualTest(){
        
        Test.StartTest();
        
        //Call The TestDriveStatusToCompletedBatchApex same As How We Called in Debugging/schedulable Class
        //calling the TestDriveStatusToCompletedBatchApex by creating a new instance
        TestDriveStatusToCompletedBatchApex testDriveinstance = new TestDriveStatusToCompletedBatchApex();


        //testDriveinstance is the instance That we created
        //and lets take The batch size as 200
        id batchid = database.executebatch(testDriveinstance,200);
        
        Test.stoptest();
        
        //Now Fetch the Records That You Have Inserted and auto updated
        list<customer__C> custfetch = [select id,Name,Car_Type__r.Name,car_Test_Drive_Start_Date_On__c,	car_Test_Drive_End_Date_On__c,car_Test_Drive_ending_on__c,Customer_Test_Drive_Status__c  From Customer__c where Customer_Test_Drive_Status__c = 'completed'];
        
        //check the Updated Batch Size is Equals To The Inserted Ones
        system.assertequals(200,custfetch.size());
    }

}