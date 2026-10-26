@istest
private class DeleteCustomerTestClass {
    
    @istest
    private static void unittest(){
        car_Type__C cartype = new Car_type__c();
        cartype.Name = 'velayudham';
        insert cartype;
        
        customer__C cust = new customer__C();
        cust.name = 'vathi';
        cust.Car_Type__c = cartype.Id;
        
        insert cust;
        
        delete cartype;
        
    }

}