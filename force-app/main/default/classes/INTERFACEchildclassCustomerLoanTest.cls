@isTest
public class INTERFACEchildclassCustomerLoanTest {
    @isTest
    static void testINTERFACEchildclassCustomerLoan() {
        // Create an instance of the implementation class
        INTERFACEchildclassCustomerLoan loan = new INTERFACEchildclassCustomerLoan();
        
        // Test typeofcustomer method
        String expectedCustomerType = 'salarifiedemployee';
        String actualCustomerType = loan.typeofcustomer();
        System.assertEquals(expectedCustomerType, actualCustomerType, 'Customer type should be salarifiedemployee');
        
        // Test gettypeofloan method
        String expectedLoanType = 'personalloan';
        String actualLoanType = loan.gettypeofloan();
        System.assertEquals(expectedLoanType, actualLoanType, 'Loan type should be personalloan');
        
        // Test getrateofinterest method
        Integer expectedRateOfInterest = 20000000;
        Integer actualRateOfInterest = loan.getrateofinterest();
        System.assertEquals(expectedRateOfInterest, actualRateOfInterest, 'Rate of interest should be 20000000');
        
        // Test durationinmonths method
        Integer expectedDurationInMonths = 60;
        Integer actualDurationInMonths = loan.durationinmonths();
        System.assertEquals(expectedDurationInMonths, actualDurationInMonths, 'Duration in months should be 60');
        
        // Test getcreditscore method
        Integer expectedCreditScore = 255;
        Integer actualCreditScore = loan.getcreditscore();
        System.assertEquals(expectedCreditScore, actualCreditScore, 'Credit score should be 255');
        
        // Test getloanamount method
        Integer expectedLoanAmount = 1000000000;
        Integer actualLoanAmount = loan.getloanamount();
        System.assertEquals(expectedLoanAmount, actualLoanAmount, 'Loan amount should be 1000000000');
        
        // Test hassubmitteddocuments method
        Boolean expectedHasSubmittedDocuments = true;
        Boolean actualHasSubmittedDocuments = loan.hassubmitteddocuments();
        System.assertEquals(expectedHasSubmittedDocuments, actualHasSubmittedDocuments, 'Documents should be submitted');
        
        // Test loanapplicationstatus method
        String expectedLoanApplicationStatus = 'Loandenied';
        String actualLoanApplicationStatus = loan.loanapplicationstatus();
        System.assertEquals(expectedLoanApplicationStatus, actualLoanApplicationStatus, 'Loan application status should be Loandenied');
    }
}