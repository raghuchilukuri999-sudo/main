@istest
private class ThisKewyword4usageTestclass {
    @istest
    private static Void UnitTest(){
        //Instance/Object Of the Comapny Class
        ThisKeyword4UsageAnotherClass obj1 = new ThisKeyword4UsageAnotherClass('Accenture');

        //instance/object of the student class
        ThisKeywordUsage4 obj = new ThisKeywordUsage4(obj1);
        
        //verifying the results of the both classes
        system.assertequals('Accenture',obj.cmp.name);
        
    }
}