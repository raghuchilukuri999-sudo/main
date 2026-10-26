@istest
private class opportunityCreationTRiggerTestClass {
    @istest
    private static void unittest(){
        
        //Testing  auto opportunity Record Creation when New Account Record is Created
        Account acc = new Account();
        acc.Name = 'cartizen';
        acc.industry = 'Technology';
        insert acc;
        
        //Testing Auto Opportuinty creation when An Existing Account Records Gets Updated
        Account acc2 = [select id,Name from Account where Name = 'Cartizen' limit 1];
        acc2.industry = 'Media';
        update acc2;
    }
    

}