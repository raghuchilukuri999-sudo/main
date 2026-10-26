@istest
private class ThisKeyword5thusageTestClass {
    @istest
    private static void UnitTest(){
        ThisKeywordusage5 obj = new ThisKeywordusage5('Raghu','salesforce',50000);
        obj.getfeesafterdiscount(10);
        obj.display();
        //verifying the results
        system.assertequals('Raghu',obj.name);
          system.assertequals('salesforce',obj.course);
          system.assertequals(50000,obj.fees);
          system.assertequals(5000,obj.discountedfees);
          system.assertequals(45000,obj.feesafterdiscount);
    }

}