public class ArthChild extends arthparent{

    // Method to calculate Simple Interest
    public Integer sical(Integer p, Integer r, Integer t) {
        Integer si = (p * r * t) / 100;
        System.debug('Simple Interest: ' + si);
        return si;
    }

    // Method to calculate Total Amount
    public Integer totalAmount(Integer p, Integer si) {
        Integer TA = si + p;
        System.debug('Total Amount: ' + TA);
        return TA;
    }
}