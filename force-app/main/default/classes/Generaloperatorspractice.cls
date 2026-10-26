public class Generaloperatorspractice {

    public static void GeneralopMethd() {

        Integer x = 5;
        Integer y = 7;
        Integer z = 9;
        Integer A = 10;
        Integer i = 0;  // Initial value is 0

        Integer sum            = x + y;
        Integer multiply       = x * y;
        Integer subtract       = y - x;
        Decimal divide         = (Decimal)y / x;
        Integer remainderValue = Math.mod(y, x);

        Integer Andvalue     = 0;
        Integer orvalue      = 0;
        Boolean equalop      = false;
        Boolean equalop2     = false;
        Boolean greaterEqual = false;

        if ((x > y) && (y > z)) {
            Andvalue = (x - y) + (y - z);
        } else {
            Andvalue = (y - x) + (z - y);
        }

        if (((x < z) && (x < y)) || (x < z)) {
            orvalue = (z - x) * (y - x);
        } else {
            orvalue = (x - z) * (x - y);
        }

        if (x == y) {
            equalop = true;
        } else {
            equalop = false;
        }

        if (y != z) {
            equalop2 = false;
        }

        if (z >= A) {
            greaterEqual = true;
        }

        if (A > z) {
            i++;
            System.debug('i was incremented. Current value of i: ' + i);
        } else {
            i--;
            System.debug('i was decremented. Current value of i: ' + i);
        }

        System.debug('Sum of x and y: '        + sum);
        System.debug('Multiply of x and y: '   + multiply);
        System.debug('Subtract of y - x: '     + subtract);
        System.debug('Divide y / x: '          + divide);
        System.debug('Remainder y mod x: '     + remainderValue);
        System.debug('AND condition value: '   + Andvalue);
        System.debug('OR condition value: '    + orvalue);
        System.debug('x equals y: '            + equalop);
        System.debug('y not equal to z: '      + equalop2);
        System.debug('z >= A: '                + greaterEqual);
        System.debug('Initial i was 0. Final i after condition: ' + i);
    }
}