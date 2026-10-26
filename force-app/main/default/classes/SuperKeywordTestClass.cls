@istest
private class SuperKeywordTestClass {
    @istest
    private static void UnitTest(){
        //creating an instance/object For The subclass/child class
       //becz,if child class comes then automatically parent class will

      //calling Both Parent And Child Default Constructors using Child Default Constructor
         superKeywordchildclassExample obj = new superKeywordchildclassExample();

    //calling Both Parent And Child Instance Methods Using Child Instance Methods
        string fullname = obj.getstudentname();
        string coursename = obj.getstudentjoinedcourse();

   //Calling The Display Method Of Child Class To print Both the parent And Child classes Print values
        obj.display();
        //verifying The Results
        system.assertequals('Raghu',obj.firstname);
        system.assertequals('Chilukuri',obj.lastname);
        system.assertequals('Java',obj.Course);
        system.assertequals('RaghuChilukuri',fullname);
        system.assertequals('Java',coursename);
    }

}