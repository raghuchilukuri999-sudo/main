@istest
public class abstractTest {
    
    @istest
    public static void test(){
        
        abstractchild obj = new abstractchild('suzuki',484651,'TS094545');
        
        system.assertequals('suzuki',obj.getcarname());
        system.assertequals(484651,obj.getcarprice());
        system.assertequals('TS094545',obj.getcarmodelnumber());
        system.assertequals(true,obj.gethasrooftop());
    }

}