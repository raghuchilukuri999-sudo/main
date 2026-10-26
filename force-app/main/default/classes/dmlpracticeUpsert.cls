public class dmlpracticeUpsert {
    
    public static void upsertmultidml(){

        //List to upsert records
        List<Account> accupsertlist = new List<Account>();
        
        //Separate lists for debug purpose
        List<Account> newAccountsList = new List<Account>();
        List<Account> updatedAccountsList = new List<Account>();
        
        System.debug('===== START OF UPSERT OPERATION =====');
        
        //Inserting records
        for(Integer i = 1; i <= 10; i++){
            
            Account acc = new Account();
            acc.Name = 'Account Refersh ' + i;
            
            accupsertlist.add(acc);
            newAccountsList.add(acc);
            
        }
        
        System.debug('Total New Records Prepared For Insert : ' + newAccountsList.size());
        
        //Printing New Records
        for(Account newAcc : newAccountsList){
            System.debug('New Account Name : ' + newAcc.Name);
        }
        
        
        //Updating Records
        List<Account> accupdatelist = [
            SELECT Id, Name, Ownership 
            FROM Account 
            WHERE Name LIKE '%Testing Acc2%' 
            LIMIT 10
        ];
        
        System.debug('Total Existing Records Fetched : ' + accupdatelist.size());
        
        for(Account accu : accupdatelist){
            
            if(accu.Ownership != 'Public'){
                
                System.debug('Before Update -> Account Name : ' + accu.Name + 
                             ' | Old Ownership : ' + accu.Ownership);
                
                accu.Ownership = 'Public';
                
                System.debug('After Update -> Account Name : ' + accu.Name + 
                             ' | New Ownership : ' + accu.Ownership);
                
                updatedAccountsList.add(accu);
            }
            
            accupsertlist.add(accu);
        }
        
        
        //Upsert Operation
        if(!accupsertlist.isEmpty() && accupsertlist.size() > 0){
            
            System.debug('Total Records Going For Upsert : ' + accupsertlist.size());
            
            upsert accupsertlist;
            
            System.debug('===== UPSERT SUCCESSFUL =====');
        }
        
        
        //Printing Inserted Records
        System.debug('===== INSERTED RECORDS =====');
        
        for(Account insertedAcc : newAccountsList){
            System.debug('Inserted Account Id : ' + insertedAcc.Id +
                         ' | Name : ' + insertedAcc.Name);
        }
        
        
        //Printing Updated Records
        System.debug('===== UPDATED RECORDS =====');
        
        for(Account updatedAcc : updatedAccountsList){
            System.debug('Updated Account Id : ' + updatedAcc.Id +
                         ' | Name : ' + updatedAcc.Name +
                         ' | Ownership : ' + updatedAcc.Ownership);
        }
        
        
        System.debug('===== END OF UPSERT OPERATION =====');
        
    }
    
}