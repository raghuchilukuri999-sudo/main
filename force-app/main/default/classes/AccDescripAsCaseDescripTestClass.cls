@istest
private class AccDescripAsCaseDescripTestClass {
    
    @istest
    private static Void unittest(){
        Account acc = new Account(Name = 'bheerudu',Description = 'This is a Game of Thrones');
        insert acc;
        
        Case cs = new case(description = null,AccountId = acc.Id);
        insert cs;
    }

}