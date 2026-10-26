@istest
public class interfaceTest {
    @istest
    public static void test(){
        interfacechild obj = new interfacechild('maruti','TS464666',445442);
        system.assertequals('maruti',obj.getcarname());
        system.assertequals('TS464666',obj.getcarmodelnumber());
        system.assertequals(445442,obj.getcarprice());
        
    }

}