@istest
private class CustCarTestDriveStartDateRemaindTest {
    
    @testsetup
    private static void SetupTestData(){
        car_Type__c Cartype = New Car_Type__c();
        cartype.Name = 'carti';
        insert cartype;
        
        //create an Instance For The Mentor Insert 
        user u = [select id,Name,Email From user where Email = 'chilukuriraghu1221@gmail.com'];
        
        user o = [select id,Name,Email From user Where Email = 'chilukuriraghu1221@gmail.com'];
        
        //create a list To Bulk Insert The customers
        list<customer__c> custlist = new list<customer__c>();
        
        for(integer i=1;i<=3;i++){
            //create an instance for creating customer
            customer__c cust = new customer__c();
            cust.Mentor_For_Customers__c = u.id;
            cust.OwnerId = o.id;
            cust.Name = 'vippu';
            cust.Car_Type__c = cartype.id;
            cust.Customer_Email__c = 'raghuchilukuri1221@gmail.com';
            cust.car_Test_Drive_Start_Date_On__c = date.newinstance(2024,08,03);
            
            //Add The cust to the custlist
            custlist.add(cust);
        }
        //check if the custlist is empty
        if(!custlist.IsEmpty()){
            insert custlist;
        }
    }
    
    @istest
    private static void ActualTest(){
    Test.startTest();
    //calling The scheduler class From the Test Method
    CustCarTestDRiveStartRemindScheduler schedulerinstance = new CustCarTestDRiveStartRemindScheduler();
    //create a jobname
    string jobname = 'cust Test drive Start date';
    //create a cron Expression
    string cronexpression = '0 0 * * * ? *';
    system.schedule(jobname,cronexpression,schedulerinstance);   
    Test.stopTest();
        
    }
 
}