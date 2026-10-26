public class calSimpleInterest {

    public static void simpleinterest(){
        decimal princiIn = 50000, roi = 10,t = 3;
        decimal si = (princiIn*roi*t)/100;
        system.debug('si='+si);
    }
}