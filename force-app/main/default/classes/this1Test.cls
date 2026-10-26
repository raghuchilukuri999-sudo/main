@istest
public class this1Test {
    
    @istest
    public static void test(){
        
         this1 instance = new  this1('vamshi',26,456);
        
        //since instance methods 
        instance.display();
        system.assertequals('vamshi',instance.name);
        system.assertequals(26,instance.age);
        system.assertequals(456,instance.marks);
    }

}