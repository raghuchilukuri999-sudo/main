@istest
private class AccountDescriptionTestClass {
    @istest
    private static void unittest(){
        Account acc = new Account();
        acc.Name = 'vichitrh';
        acc.ownership = 'Public';
        acc.Industry = 'Technology' ;
        acc.NumberOfEmployees = 435356;
        acc.AnnualRevenue = 78676846.0;
        
        insert acc;
    }

}