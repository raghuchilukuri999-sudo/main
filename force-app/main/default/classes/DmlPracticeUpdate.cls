public class DmlPracticeUpdate {
    
    Public Static Void AccUpdate(){
        
        //fetch account
        Account acc = [select id,Name,ownership,website from Account where Name = 'Testing Acc2 10'];
        system.debug('The Account We got is '+acc.Name);
        system.debug('The Account We got is '+acc.ownership);
        system.debug('The Account We got is '+acc.Website);
        
        //Updating Ownership and Website
        acc.Ownership = 'Private';
        acc.Website = 'www.Energybooster.com';
        
        update acc;
        
        System.debug('The Updated ACcount is '+acc);
        
        
    }
    
    public static void AccBulkupdate(){
        
        List<Account> acclisttoupdate = New List<Account>();
        
        List<Account> acclist = [select id,Name,ownership,Website from Account where Name like '%Testing Acc2%' and ownership != 'Public' Limit 10];
        
        System.debug('The Accounts in the List'+acclist);
        
        for(Account a2 : acclist){
            
            System.debug('The Previous Ownership is '+a2.ownership);
            system.debug('The Previous Website is '+a2.website);
            
            a2.ownership = 'Public';    
            a2.website = 'www.NewWebsite.com';
            
            acclisttoupdate.add(a2);
            system.debug('The Name Now is '+a2.Name);
            System.debug('The Ownership Now is '+a2.ownership);
            system.debug('The website Now Will be'+a2.website);

        }
        
        if(!acclisttoupdate.isempty() && acclisttoupdate.size()>0){
            
                    update acclisttoupdate;
        }

    }

}