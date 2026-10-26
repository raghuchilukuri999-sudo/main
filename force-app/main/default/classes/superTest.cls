@istest
public class superTest {
    @istest
    public static void test(){
        //rememeber one thing the default constructor code 
        //cant be covered by calling the child constructor becz it just covers the parent class parameterized constructor
        superchild obj = new superchild();
        obj.getstddetails();
        obj.getstdcourse();
        system.assertequals('bhargava ram',obj.getstddetails());
        system.assertequals('python',obj.getstdcourse()); 
    }

}