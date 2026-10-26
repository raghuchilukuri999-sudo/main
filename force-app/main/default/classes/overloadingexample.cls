public class overloadingexample {
    //instance variables
    public integer result;
    //constructor
    public overloadingexample(){
        system.debug('===Overloading Class Constructor is===');
    }
    //instance methods
    public integer sum(integer a,integer b){
        result = a + b;
        system.debug('==the sum of the two numbers is' + result);
        return result;  
    }
    public integer sum(integer a,integer b,integer c){
        result = a + b + c;
        system.debug('==the sum of three numbers is' + result);
        return result;
    }
    // remember integer a,b,c are called input parameters
    // here the number of input parameters are different
    // in first one integer a,b
    // in second they are three a,b,c
    // This Is called Method Overloading( or we can say this one way of Oer Loading In polymorphism)
    // by this method the readability becomes easy becomes input parametres ay be differet in number but the variable is same i.e "sum"
}