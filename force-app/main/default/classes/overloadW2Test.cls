@istest
public class overloadW2Test {
    
    @istest
    public static void test(){
        integer a=10;
        integer b=20;
        double p=1.0;
        double s=1.0;
        
        overloadW2 cal = new overloadW2();
        integer result1 = cal.sum(a,b);
        double result2 = cal.sum(p,s);
        
        system.assertequals(30,result1);
        system.assertequals(2.0,result2);
    }

}