public virtual class arthemicparentclass {
    // you have to use "Virtual Keyword Inorder To A class As A Parent Class
    // on the Object On Which You Want To Make It As A Child Use "Excludes" Keyword And Add The Parent Class Name At The End Of It
    // Thats How YOu Create A Relationship As Parent ANd Child Of One Class to Another
    //instance variables
    public integer result;
    //Constructor
    public arthemicparentclass(){
        system.debug('Arthmetic Class Constructor iS called');
    }
    //instance methods
    public integer add(integer a,integer b){
           result = a + b;
    system.debug('The sum Of tHe Given Number is' + result);
        return result;
    }
    public integer difference(integer a,integer b){
        result = a - b;
        system.debug('The Difference in The Given Numbers Is' + result );
        return result;
    }
     public integer multiply(integer a,integer b){
        result = a * b;
        system.debug('The Multiplication of The Given Numbers Is' + result );
        return result;
    }
     public integer remainder(integer a,integer b){
        result = system.Math.MOD(a,b);
         // we cant directly write the remainder
         // so we use a predefined function/method called "system class" since it is static method
         // we call it by Classname.Methodname i.e we write it as system.Math.MOD(a,b)
         // where Math.MOD is A classname.methodname
        system.debug('The remainder of The Given Numbers Is' + result );
        return result;
    }
 
}