@istest
private class ThisKeywordusage6TestClass {
    @istest
    private static void UnitTest(){
     Thiskeywordusage6 obj = new Thiskeywordusage6();
     system.debug('===The Instance Of the class Is=='+ obj);
     Thiskeywordusage6 objcopy = obj.Studentplacementdetails('Raghu','salesforce',50000,'Accenture',700000);
     system.debug('===The Instance Of the class Is=='+ objcopy);
     objcopy.getfeesdiscount(10);
     objcopy.display();
        //verifying the results
        system.assertequals('Raghu',obj.name); 
         system.assertequals('salesforce',obj.course);
         system.assertequals(50000,obj.fees);
         system.assertequals(5000,obj.discountedfees);
         system.assertequals('Accenture',obj.companyname);
        system.assertequals(700000,obj.ctcoffered);
        
    }

}