@istest
public class ContactphoneAndEmailTest {
    @istest
    public static void Test(){
        contact con = new contact();
        con.lastname = 'Sameera';
        con.phone = null;
        con.Email = null;
        
    try{
        insert con;
       }
    catch(dmlexception e){
        
        system.assertequals(true,e.getmessage().contains('please Provide phone and email'));
        
    }
    }

 

}