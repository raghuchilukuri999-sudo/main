@istest
private class ThisKeywordUsage3Example3TestClass {
    @istest
    private static void UnitTest(){
        //creating Instance/object for The class
ThisKeywordusage3Example3 obj = new ThisKeywordusage3Example3();
        string result1 = 'Raghu';
        string result2 = 'civil';
        integer result3 = 560;
        integer result4 = 1000;
//Here We Are Calling The Default Constructor
//Becz we Are Calling Parameterized Constructor
//From The Default Constructor
// by using This('Raghu','civil',560)
//but you have To give input/local parameters values in the bracket
//and this should be used in default constructor coding stage
obj.display();
        //verify the results
        system.assertequals('Raghu',result1);
        system.assertequals('civil',result2);
        system.assertequals(560,result3);
        system.assertequals(1000,result4);
    }

}