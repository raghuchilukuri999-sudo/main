public class INTERFACEchildclassCustomerLoan implements INTERFACEparentclassLOAN {
    // Implementing the methods from the interface
    public String typeofcustomer() {
        return 'salarifiedemployee';
    }

    public String gettypeofloan() {
        return 'personalloan'; 
    }

    public Integer getrateofinterest() {
        return 20000000;
    }

    public Integer durationinmonths() {
        return 60;
    }

    public Integer getcreditscore() {
        return 255;
    }

    public Integer getloanamount() {
        return 1000000000;
    }

    public Boolean hassubmitteddocuments() {
        return true;
    }

    public String loanapplicationstatus() {
        return 'Loandenied';
    }

    // Method to display all details
    public void display() {
        System.debug('Customer Type: ' + typeofcustomer());
        System.debug('Loan Type: ' + gettypeofloan());
        System.debug('Rate of Interest: ' + getrateofinterest());
        System.debug('Duration in Months: ' + durationinmonths());
        System.debug('Customer Credit Score: ' + getcreditscore());
        System.debug('Loan Amount: ' + getloanamount());
        System.debug('Customer Documents Submission: ' + hassubmitteddocuments());
        System.debug('Loan Application Status: ' + loanapplicationstatus());
    }
}