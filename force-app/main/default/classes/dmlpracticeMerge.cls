public class dmlpracticeMerge {
    
    public static void dmlmerge(){
        
        List<Account> acclist = [select id,Name From Account where Name like '%Testing Acc2%' LIMIT 5];
        system.debug('The accounts in the List are '+acclist);
        
        List<contact> conlist = new List<contact>();
        
        integer count = 0;
        
        for(Account acc : acclist){
            
            contact con = new contact();
            con.Lastname = 'Karuna'+count++;
            con.AccountId = acc.id;
            con.Phone = '+918932378900';
            con.Email = 'raithubaxar@gmail.com';
            
            conlist.add(con);
        }
        
        if(conlist.size() > 0){
            
            insert conlist;
            system.debug('The contacts inserted are '+conlist);
        }
        
        
        Account accmaster = [select id,Name from Account Where Name = 'Master Tcs' Limit 1];
        system.debug('The accmaster is '+accmaster);
        
        
        Contact conmaster = [select id,Firstname,Lastname,AccountId from contact where LastName like '%Master%' Limit 1];
        system.debug('The conmaster is '+conmaster);
        
        
        //Merging Contacts
        
        List<Contact> mergeContacts = [select id,Firstname,Lastname From contact where LastName like '%Karuna%' LIMIT 2];
        
        for(contact Mergecon : mergeContacts){
            
            System.debug('The each merge Contact is '+mergecon);
            
            if(conmaster.id != mergecon.id){
                
                merge conmaster Mergecon;
                
                System.debug('Merged Contact '+mergecon.id+' into '+conmaster.id);
            }
        }
        
        
        //Moving Contacts
        
        List<Contact> movecons = [select id,AccountId from contact where AccountId IN (select id from Account where Name like '%Testing Acc2%') LIMIT 5];
        
        System.debug('The contacts to move are '+movecons);
        
        for(contact con : movecons){
            
            con.AccountId = accmaster.id;
        }
        
        if(movecons.size() > 0){
            
            update movecons;
            
            System.debug('Contacts moved to master account '+movecons);
        }
        
        
        //Merging Accounts
        
        List<Account> mergeAccounts = [select id,Name From Account where Name like '%Testing Acc2%' LIMIT 2];
        
        for(Account Mergeacc : mergeAccounts){
            
            System.debug('The each merge Account is '+mergeacc);
            
            if(accmaster.id != mergeacc.id){
                
                merge accmaster mergeacc;
                
                System.debug('Merged Account '+mergeacc.id+' into '+accmaster.id);
            }
        }
        
        System.debug('Merge Process Completed Successfully');
    }
}