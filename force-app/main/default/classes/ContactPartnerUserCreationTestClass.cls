@istest
private class ContactPartnerUserCreationTestClass {
    
    @testSetup
    private static void testsetupdata(){
        Account acc = new Account();
        acc.name = 'virochith';
        insert acc;
        
        //update/convert The Account As a Partner Account
        Account pa = [select id,Name,ispartner From Account where id = :acc.id Limit 1];
        pa.IsPartner = true;
        update pa;
        
        //create a contact for the partner Account
        contact pcon = new contact();
        pcon.LastName = 'vibuddi';
        pcon.Email ='vibuddi55486@gmail.com';
        pcon.AccountId = acc.id;
        insert pcon;
    }
    @istest
    private static void ActualTest(){
         Test.starttest();
        string jobname = 'Auto create Partner user Fr Contact';
        string cronExpression = '0 30 * * * ? *';
        ContactpartnerUserSchedulerClass schedulerinstance = new  ContactpartnerUserSchedulerClass();
        system.schedule(jobname,cronexpression,schedulerinstance);
        Test.StopTest();
    }
   

}