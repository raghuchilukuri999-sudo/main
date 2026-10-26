@istest
private class ArthmeticTestClass {
    @istest
    private Static Void Arthmetic(){
        // pass the values To The Input
        //How To Invoke/call Both Parent And Child Classes At A time From An Object
//Pass The Values To the Input Parameters in the Methods
Integer a = 400;
Integer b = 200;
Integer p = 100000;
Integer t = 60;
Integer r = 2;
//where a and b Are From Parent Class
//where p,r,t Are From Child Class
//t is the time in months
//r is the rate of interest in %

//now create an instace/object for the child class
//because child is in relationship with parent only one class is enough 
// that too on the child class should be created
ArithmeticChildClass Arth = new ArithmeticChildClass();
//call the parent calss instance methods
Integer AddResult = Arth.add(a,b);
Integer SubtractResult = Arth.difference(a,b);
Integer MultiplyResult = Arth.multiply(a,b);
Integer RemainderResult = Arth.remainder(a,b);
//call Child Class Insatnce Methods
Integer SIResult = Arth.calculateSI(p,t,r);
Integer TotalAmountResult = Arth.calculateTotalAmount(p);
        //Verifying The Results
         system.assertequals(600,AddResult);
         system.assertequals(200,SubtractResult);
         system.assertequals(80000,MultiplyResult);
         system.assertequals(0,RemainderResult);
         system.assertequals(120000,SIResult);
         system.assertequals(220000,TotalAmountResult);
    }
}