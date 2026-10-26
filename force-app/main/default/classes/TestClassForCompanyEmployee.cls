@istest
private class TestClassForCompanyEmployee {
    @istest
    private static void UnitTest(){
        CompanyclassThiskewyword4Usage obj = new CompanyclassThiskewyword4Usage('Google');
EmployeeClassThisKeyword4Usage obj1 = new EmployeeClassThisKeyword4Usage(obj);
        //verifying the results
        system.assertequals('Google',obj1.company.name);
    }

}