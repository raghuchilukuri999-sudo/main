public class ArithmeticChildClass extends arthemicparentclass{
    // you have to use "Virtual Keyword Inorder To A class As A Parent Class
    // on the Object On Which You Want To Make It As A Child Use "Excludes" Keyword And Add The Parent Class Name At The End Of It
    // Thats How YOu Create A Relationship As Parent ANd Child Of One Class to Another
    // Instance variables
    public Integer si;

    // Constructor
    public ArithmeticChildClass() {
        System.debug('=== Interest ArithmeticChildClass Constructor Is Called ===');
    }

    // Instance Method To Calculate Simple Interest
    public Integer calculateSI(Integer p, Integer t, Integer r) {
        si = (p * t * r) / 100;
        System.debug('=== The Simple Interest === ' + si);
        return si;
    }

    // Instance Method To Calculate Total Amount To Be Paid With Interest
    public Integer calculateTotalAmount(Integer p) {
        Integer result = si + p;
        System.debug('=== The Total Amount is ' + result);
        return result;
    }
}