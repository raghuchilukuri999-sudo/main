@istest
private class ThisKeywordUsage3ExampleTestClass {
    @istest
    private Static Void UnitTest(){
        //creating an instance/object for the class
Thiskeywordusage3example obj = new Thiskeywordusage3example('Raghu','civil',560);
            string result1 = 'Raghu';
            string result2 = 'civil';
            integer result3 = 560;  
//here we are calling the parameterized and input/local parameters values here
//such that both deafult constructor and parameterized constructor values at the same time
// Also We Have Used 'This()' Keyword in Parameterized Constructor Inorder To Call 
//Default Constructor variable(i.e totalmarks) From Parameterized constructor
//along with The Parameterized instance varaiables(i.e name,branch,marksscored)
//calling the Display method() in order to print the values 
obj.display();
        //verifying The Results
        system.assertequals('Raghu',result1);
        system.assertequals('civil',result2);
        system.assertequals(560,result3);
    }

}