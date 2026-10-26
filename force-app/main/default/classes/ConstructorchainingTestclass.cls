@istest
private class ConstructorchainingTestclass {
    @istest
    private static void UnitTest(){
        ConstructorChainingExample obj = new ConstructorChainingExample('Accenture',500000);
        string result1 = 'Raghu';
        string result2 = 'civil';
        integer result3 = 560;
        integer result4 = 1000;
        string result5 = 'Accenture';
        integer result6 = 500000;
//here calling the parameterized constructor2
// and also giving input/local parameters values in the brackets 
//such that the parameterized constructor1 and default constructor can be called automatically
//becz,we used 'this()' in parameterized constructor1 to call default constructor from parameterized constructor 1
//And we used 'this()' in parameterized constructor2 to call Parameterized constructor1 from parameterized constructor 2

//calling the display methods to print all values
obj.display();
        //verifying the values 
        system.assertequals('Raghu',result1);
         system.assertequals('civil',result2);
         system.assertequals(560,result3);
         system.assertequals(1000,result4);
         system.assertequals('Accenture',result5);
         system.assertequals(500000,result6);
    }
}