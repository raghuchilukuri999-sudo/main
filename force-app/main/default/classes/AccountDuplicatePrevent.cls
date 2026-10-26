@istest
public class AccountDuplicatePrevent {
    @istest
    public static void Test(){
        
        Account acc = New Account();
        acc.Name = 'barbie';
        insert acc;
    
        
        Account acc2 = new Account();
        acc2.Name = 'barbie';

        try{
           insert acc2;
        }
        catch(dmlException e){
            system.assertequals(false,e.getmessage().contains('This Name already Exists'));
        }
    }

}