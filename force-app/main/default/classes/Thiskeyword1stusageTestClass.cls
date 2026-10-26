@istest
private class Thiskeyword1stusageTestClass {
    @istest
    private static void Testclass(){
        //creating an instance/object For the class
THISkeyword1stusage obj = new THISkeyword1stusage('vamshi','civil',45000);
//in the class we have used a parameteized constructor
//so give the same constructor name and give required values 

//calling the instance display methods
obj.display();
        //verifying the actual results(values came out) with expected results(variable values that you have given in debugging parameterized constructor)
        //since we know instance variables will be called by objectname.variable name ex:obj.name
        system.assertequals('vamshi',obj.name);
         system.assertequals('civil',obj.branch);
         system.assertequals(45000,obj.feespaid);
        
    }

}