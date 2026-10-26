@istest
private class overloadingway2testclass {
    @istest
    private static void way2test(){
        //creating an instance/object For the Class
overloadingmethodway2 way2 = new overloadingmethodway2();
integer a = 50;
integer b = 60;
double x = 240.95;
double y = 302.36;
integer result1 = way2.sum(a,b);
double result2 = way2.sum(x,y);
        system.assertequals(110,result1);
        system.assertequals(543.31,result2);  
    }
}