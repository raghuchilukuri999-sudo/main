@istest
public class this2test {
    
    @istest
    public static void test(){
        
        //providing values
        integer fees;
        integer percentageofmarks;
        integer discount;
        
        This2 instance = new This2();
        instance.getFeesAfterDiscount(9000,90);
        system.assertequals(9000,instance.fees);
        system.assertequals(90,instance.percentageofmarks);
        
        this2 obj = new this2();
        instance.getFeesAfterDiscount(8000,85);
        system.assertequals(8000,instance.fees);
        system.assertequals(85,instance.percentageofmarks);
        
        this2 obj1 = new this2();
        instance.getFeesAfterDiscount(6000,65);
        system.assertequals(6000,instance.fees);
        system.assertequals(65,instance.percentageofmarks);
    }
    

}