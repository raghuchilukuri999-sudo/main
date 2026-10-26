@istest
private class CarPriceReductionBatchTestClass {
    
    @TestSetup
    private static void TestsetupData(){
        car_type__c cartype = new car_type__c();
        cartype.name = 'booshanbajan';
        cartype.Car_Price__c = 45346534.0;
        insert cartype;
        
        Test.setCreatedDate(cartype.Id, Date.today().addDays(-51));
        
        //create a list to store the customer__c data insertion
        list<customer__c> custlist = new list<customer__c>();
        
        for(integer i=1;i<=3;i++){
            //create an instance for creating customer Record
            customer__c cust = new customer__c();
            cust.name = 'sananam'+i;
            cust.Car_Type__c = cartype.Id;
            
            //add the cust to the list
            custlist.add(cust);
            
        }
        //check if the adding is successful
        if(!custlist.isEmpty()){
            insert custlist;
        }
    }
    
    @istest
    
    private static void ActualTest(){
        Test.startTest();
        
        //creating an instance to call the batch apex
        CarPriceReductionBatchApexClass cartypebatchinstance = new CarPriceReductionBatchApexClass();
        id batchid = database.executebatch(cartypebatchinstance,200);
        
        Test.stopTest();

    }

}