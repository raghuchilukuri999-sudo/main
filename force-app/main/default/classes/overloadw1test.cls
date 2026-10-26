@istest
public class overloadw1test {
    @istest
    public static void test(){
        integer a = 100;
        integer b= 200;
        integer c=300;
        
         overloadW1 cal = new  overloadW1();
        integer result1 = cal.sum(a,b);
        integer result2 = cal.sum(a,b,c);
        
        system.assertequals(300,result1);
        system.assertequals(600,result2);
    }

}