public class Contacttriggerhelper {
    
    public Static Map<String,contact> connames = new Map<string,contact>();  
    public Static List<contact> conlist = new list<contact>();
    
    public static Void beforeinsert(list<contact> newlist){
        
        for(contact con : newlist){
            
            string key = (con.firstname == null? '':con.FirstName.trim()) + '|' + con.lastname.trim();
            connames.put(key,con);
            
            if(con.phone == null && con.email == null){  
                con.adderror('Please provide phone and Email for the contact'); 
                
            }
            
            string MailingAddress = 
                (con.MailingStreet ==null ? '':con.MailingStreet.trim()) + '|' +
                (con.MailingCountry == null ? '' : con.MailingCountry.trim()) + '|' +
                (con.MailingCity == null ? '' : con.MailingCity.trim()) + '|' +
                (con.MailingState == null ? '' : con.MailingState.trim()) + '|' +
                (con.mailingpostalcode == null ? '' : con.Mailingpostalcode.trim());
            
            if(mailingaddress != '||||'){
                con.OtherStreet     = con.MailingStreet;
                con.OtherCity       = con.MailingCity;
                con.OtherState      = con.MailingState;
                con.OtherPostalCode = con.MailingPostalCode;
                con.OtherCountry    = con.MailingCountry;
                conlist.add(con);
                
            }    
            
        }
        
        for(contact excon : [select id,firstname,lastname From contact]){
            
            String key = ((excon.firstname == null ? '': excon.firstname.trim()) + '|' + excon.lastname.trim());
            
            if(connames.containskey(key)){
                connames.get(key).adderror('There is contact With same name Exists');
            }
        }
        
        
        
    }
    
    public static void beforedelete(List<contact> oldlist){
        set<id> Caseset = new set<id>();
        for(case cs : [select id,ContactId,origin from case where origin = 'Phone' and contactid in : oldlist]){
            caseset.add(cs.ContactId);
            
        }
        for(contact con :oldlist){
            if(caseset.contains(con.id)){
                con.adderror('The contact has Cases With origin as Phone So It cant be deleted');
            }
        }
    }
    
    public static void beforeupdate(List<Contact> newlist){
        for(Contact con : newlist){
            
            String MailingAddress = 
                (con.MailingStreet == null ? '' : con.MailingStreet.trim()) + '|' +
                (con.MailingCountry == null ? '' : con.MailingCountry.trim()) + '|' +
                (con.MailingCity == null ? '' : con.MailingCity.trim()) + '|' +
                (con.MailingState == null ? '' : con.MailingState.trim()) + '|' +
                (con.MailingPostalCode == null ? '' : con.MailingPostalCode.trim());
            
            if(MailingAddress != '||||'){
                con.OtherStreet     = con.MailingStreet;
                con.OtherCity       = con.MailingCity;
                con.OtherState      = con.MailingState;
                con.OtherPostalCode = con.MailingPostalCode;
                con.OtherCountry    = con.MailingCountry;
            }
        }
    }
               
               
}