public class AccountTriggerhelper {
    
    //This is to Avoid recurssions but for a single record transaction
    Public Static Boolean isfirstrun = true;
    
    //This is for Bulk record Transaction 
    //if we have 500 records trigger Will process Them Of each size = 200
    //So if we use Static Boolean variable At that time it will just allow The first batch and Will Stop second batch
    public Static set<id> processedids = new set<id>();
    
    //This Will cause a recursion as this Will update Account when ever Trigger is fired and
    //that will again Trigger's the trigger which is a Loop
    /*  public static void afterupdate(list<Account> newlist,map<id,Account> oldmap){
        
        list<Account> acclist = new list<Account>();
  
      for(Account acc:newlist){

      Account oldacc = oldmap.get(acc.id);
            
            if(acc.industry == 'Chemicals'&& oldacc.industry != acc.industry){
                acc.Rating = 'Hot';
            }
            acclist.add(acc);
        }
        
           if(!acclist.isempty){
            update acclist;
            }
}
   */ 
    
    
    //This is to over come recursion when it's a Single record transaction Which is Not Suggested for Bulk records
    //as it will skip the Next batch
    /*
    public static void afterupdate(list<Account> newlist,Map<id,Account> oldmap){
        
        list<Account> acclist = new list<Account>();
        
        
        if(isfirstrun){
            //Setting the isfirstrun to false again
            isfirstrun = false;
            for(Account acc : newlist){

            Account oldacc = oldmap.get(acc.id);

                if(acc.Industry == 'chemicals' && oldacc.industry != acc.industry){
                    acc.Rating = 'Hot';
                }
                acclist.add(acc);
            }
            
            if(!acclist.isempty){
            update acclist;
            }
            
        }  
        
    }*/
    
    public Static void afterupdate(list<Account> newlist,Map<id,Account> oldMap){
        
        list<Account> acclist = new list<Account>();
        
        for(Account acc:newlist){
            
            Account oldacc = oldmap.get(acc.id);
            
            //Why? we Again use an instance or Object To Update The thing ?
            //As we know After and update Salesforce Makes a record for after Scenarios
            //so we explicitly bringing It's id and making Updates if any and Again Performing Updates
            
            Account accupdaate = new Account();
            
            if(!processedids.contains(acc.id) && oldacc.Industry != acc.Industry && acc.industry == 'Chemicals'){
                
                processedids.add(acc.id);
                
                accupdaate.id = acc.id;
                accupdaate.rating = 'hot';
                acclist.add(accupdaate);
            }
            if(!acclist.isempty()){
                update acclist;
            }
            
        }
    }
    
    public static void beforeupdate(list<Account> newlist,Map<id,Account> oldmap){
        
        for(Account acc : newlist){
            
            Account accold = oldmap.get(acc.id);
            
            if(acc.name != accold.name){
                acc.adderror('The Name cant be Changed');
            }
        }
        
    }
 
}