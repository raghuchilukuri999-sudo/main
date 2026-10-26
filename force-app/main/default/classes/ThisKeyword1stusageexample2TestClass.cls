@istest
private class ThisKeyword1stusageexample2TestClass {
    @istest
    private static void Testclass(){
        //creating an instance/object for the class
ThisKeyword1stusageExample2 obj = new ThisKeyword1stusageExample2('python',30000,52);
//here the object/instance variable is obj
//we used the constructor only but,we have give our own course name,fees and duration 
//becz,the name,fees,duration(local/input parameters) are equalled to instance variables course name,fees,duration

//calling the instance display method

obj.display();
        
        //verifying the results
        system.assertequals('python',obj.coursename);
        system.assertequals(30000,obj.coursefees);
        system.assertequals(52,obj.courseduration);
        
    }
}