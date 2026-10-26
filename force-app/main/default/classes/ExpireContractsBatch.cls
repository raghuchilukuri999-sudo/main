public class ExpireContractsBatch implements Database.Batchable<SObject> {
    
         // The start method constructs the query and returns the Database.QueryLocator
        public Database.QueryLocator start(Database.BatchableContext BC) {
        
        //querying The Records That You wanna Update
        string query = 'select id,Name,Enddate,Status From Contract where Enddate < Today AND Status <> \'Expired\'';
            return database.getquerylocator(query);
        }
    
       // The execute method processes each batch of records
       public void execute(Database.BatchableContext BC, List<contract> scope) {
        
        //create A list To Bulk Update the Contracts For Each batch Of Records Processed
        list<Contract> contractsProcessed = new list<contract>();
        
        //Iterate Through each Batch of contracts received From The Start Method
        for(contract cr:scope){
            //set The Status Of each Contract as Expired
            cr.status = 'expired';
            //Add each Contract To The list
            contractsprocessed.add(cr);
        }
        
        //check If There are Any contracts In the list
        if(!contractsprocessed.isEmpty()){
            update contractsprocessed;
        }

    }
    
    
    // The finish method performs post-processing operations
    public void finish(Database.BatchableContext BC) {
        
        //This is Optional

    }
}