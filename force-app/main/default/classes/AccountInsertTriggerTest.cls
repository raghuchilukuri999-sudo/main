@istest
private class AccountInsertTriggerTest {
    @istest
    private static Void unittest(){
        Account acc = new Account();
        acc.Name = 'Bhojan';
        acc.website = '';
        acc.phone = '';
         try{
            insert acc;
        }
        catch(DMLexception e){
            system.assertEquals(true, e.getMessage().contains('The Account should Have Both Phone and Website'));
        }

    }
      @istest
    private static Void unittest2(){
        Account acc2 = new Account();
        acc2.Name = 'vivah';
        acc2.website = 'www.vivah.com';
        acc2.phone = '';
        try{
            insert acc2;
        }
        catch(DMLexception e){
            system.assertEquals(true, e.getMessage().contains('The Account should Have Both Phone and Website'));
        }
    }
    
      @istest
    private static Void unittest3(){
        Account acc3 = new Account();
        acc3.Name = 'vibooth';
        acc3.website = '';
        acc3.phone = '464684684';
         try{
            insert acc3;
        }
        catch(DMLexception e){
            system.assertEquals(true, e.getMessage().contains('The Account should Have Both Phone and Website'));
        }
    }

}