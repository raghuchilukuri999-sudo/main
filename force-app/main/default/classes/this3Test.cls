@istest
public class this3Test {
    
    @istest
    public static void test(){
        this3 instance = new this3('raghu',26,456);
        instance.display();
         system.assertequals('raghu',instance.name);
         system.assertequals(26,instance.age);
         system.assertequals(456,instance.marksscored);
         system.assertequals(1000,instance.totalmarks);
    }

}