@istest
private class overloadingmethodway1testclass {
    @istest
    private static void way1test(){
        //creating an instance/object for the overloadingexample class
overloadingexample way1 = new overloadingexample();
// here way1 is the variable name of this object and also
// it is the 1st way of overloading method so i took like this
// 2nd way is taken in another calss i.e over loading example 2
//passing the values to the required input parameters
Integer a = 300;
Integer b = 200;
Integer c = 100;
//calling the insatnce methods
Integer result1 = way1.sum(a,b);
Integer result2 = way1.sum(a,b,c);
        //verifying the results
        system.assertequals(500,result1);
        system.assertequals(600,result2);
    }
}