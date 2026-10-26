public class staticNONstaticMethdEx {
    
    //example without comstructor and seperate variables

    //method
    public static void area(){
        decimal length = 5,breadth = 6.6;
        decimal area = length*breadth;
        system.debug('printing the area = '+area);
    }
    
    //method
    public static void perimeter(){
        decimal length = 10,breadth = 6.6;
        decimal perimeter = 2*(length+breadth);
        system.debug('printing the perimeter = '+perimeter);
    }
}