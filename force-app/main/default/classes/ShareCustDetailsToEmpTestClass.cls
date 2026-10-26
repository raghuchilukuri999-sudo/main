@istest
private class ShareCustDetailsToEmpTestClass {
    
    @TestSetup
    
    private Static void SetupTestData(){
        
        list<customer__c> custlist = new list<customer__c>();
        
        //create an instance To create a Car Type
        car_type__c cartype = new car_type__c();
        cartype.name = 'booshanbajan';
        insert cartype;
        
        //create an Instance To create Toyoto branch
        Toyoto_Branch__c toyoto = new Toyoto_Branch__c();
        toyoto.Name = 'BOOCHALL';
        insert toyoto;
        
        //create an instance To Create Employee
        Employee__c Emp = new Employee__c();
        Emp.Name = 'Bhaskar';
        Emp.Employee_Email__c = 'chilukuriraghu1221@gmail.com';
        insert Emp;
        
        //create an instance to Create the Marketing Team members
        Marketing_Team__c MarketingTeam = new Marketing_Team__c();
        
        MarketingTeam.Name = 'vidyuthvirinchi';
        MarketingTeam.Marketing_Member_Email__c = 'vidyuthvirinchi4545@gmail.com';
        MarketingTeam.Marketing_Team_Established_Date__c = Date.Today().addDays(-101);
        MarketingTeam.Employee_In_the_Marketing_Field__c = Emp.id;
        MarketingTeam.Marketing_Related_Branch_del__c = toyoto.id;
        MarketingTeam.Marketing_Car_Type__c = cartype.id;
        insert MarketingTeam;
        
        //Create A 200 Customers 
        for(integer i=1;i<=200;i++){
            //create an Instance For Creating a Customer
            customer__c cust = new customer__c();
            cust.Name = 'ramanujan'+i;
            cust.Employee_Dealing_With_Customer__c = Emp.id;
            Cust.Supporting_Marketing_Team__c = MarketingTeam.id;
            //Add the Customer To The custlist
            custlist.add(cust);
            
        }
        //check If The Custlist Is Empty
        if(!custlist.IsEmpty()){
            insert Custlist;
        }
        
    }
    
    @istest
    private static Void ActualTest(){
        Test.startTest();
        //creating an Instance Of The Batch Class To call the Batch Apex
        shareCustDetailsToEmpBatchApex sharebatchinstance = new shareCustDetailsToEmpBatchApex();
        id batchid = database.executebatch(sharebatchinstance,200);
        Test.StopTest();
       
    }
   

}