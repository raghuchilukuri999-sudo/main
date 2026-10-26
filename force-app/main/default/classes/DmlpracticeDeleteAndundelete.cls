public class DmlpracticeDeleteAndundelete {
    
    public static void deletedml(){
        
        //Here we have Tried For a Single record But we couldn't find a Single record That Matches the query
        //and salesforce Will auto throw execption if it doesn't finds a single record
        //so we used list to fetch and Delete it.
        //Even with list also we couldn't get that Single ercord if its abscent at Salesforce org
        //but just to avoid execption we used List to fetch
        List<Account> acclist = [SELECT Id, Name, Ownership, Website FROM Account
            WHERE Ownership = 'Public' AND Name LIKE '%Testing Acc2 10%' LIMIT 1];
        
        if(!acclist.isEmpty()){
            
            Account acc = acclist[0];
            
            System.debug('The Name is ' + acc.Name);
            System.debug('The ownership is ' + acc.Ownership);
            
            delete acc;
            
            System.debug('Record Deleted Successfully');
            
        }else{
            
            System.debug('No Account With Such Details Are Found');
        }
    }
    
    public static void Bulkdeletedml(){
        
        List<Account> acclist = [SELECT Id, Name FROM Account WHERE Name LIKE '%Testing Acc2%' LIMIT 10];
      
        if(!acclist.isEmpty()){
            
            delete acclist;
            
            System.debug('Records Deleted Successfully');
            
        }else{
            
            System.debug('No Records Found For Bulk Delete');
        }
    }
    
    public static Void undeletesingle(){
        
        list<Account> acclistundelete = [SELECT Id, Name FROM Account WHERE Name LIKE '%Testing Acc2%' LIMIT 10];
        
        if(!acclistundelete.isempty() && acclistundelete.size()>0){
            undelete acclistundelete;
        }
        
        system.debug('The Accounts in the list'+acclistundelete);
        
    }
}