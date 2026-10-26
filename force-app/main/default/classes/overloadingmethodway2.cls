// This Way2 of overloading Method is all about Providing Different Data Types For Each Instance Method as input parameters
// (i.e integer for one and double for another one)
public class overloadingmethodway2 {
    //instance variables
    public integer result1;
    public double result2;
    //instance methods
    public integer sum(integer a, integer b){
         result1 = a + b;
        system.debug('===The Sum Of The Given Digits is===' + result1);
         return result1;
    }
    public double sum(double a,double b){
         result2 = a + b;
         system.debug('===The Sum Of The Given Digits is===' + result2);
         return result2; 
    }
}