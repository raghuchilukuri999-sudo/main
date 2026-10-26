public class CreatecontactPartnerUserHandler {
    
    public static void createContactPartnerUser(){
        //fetch the contacts for The partner Accounts for which a partner user Account is not created
        list<contact> contacts = [select id,firstname,Lastname,Title,Department,Email,Phone,MobilePhone,Account.ispartner From Contact where 
                                 Account.ispartner = True And id not in (select contactid From user)];
        //fetch the Partner community user Profile Record
        profile p =[select id,name From Profile Where Name = 'Partner Community user' Limit 1];
        
        //create A list to Bulk Insert The users
        list<user> userslist = new list<user>();
        
        //iterate through the partner contacts
        for(contact pc : contacts){
            //for each Partner contact create a Partner user
            user u = new user();
            u.firstname = pc.firstname;
            u.LastName = pc.lastname;    
			u.Email = pc.email;
			u.Alias = pc.firstname;
			u.Username = pc.email;
            u.Phone = pc.phone;
            u.MobilePhone = pc.MobilePhone;
			u.CommunityNickname = pc.lastname;  
			u.LocaleSidKey = 'en_US';
			u.TimeZoneSidKey = 'GMT';
			u.ProfileID = p.id;
			u.LanguageLocaleKey = 'en_US';
			u.EmailEncodingKey = 'UTF-8';
			// Add each user to the User List
			userslist.add(u);
        }
        //check The user list
        if(!userslist.isEmpty()){
            insert Userslist;
        }
    }

}