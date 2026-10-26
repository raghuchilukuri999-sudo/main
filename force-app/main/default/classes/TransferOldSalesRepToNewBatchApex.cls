public class TransferOldSalesRepToNewBatchApex implements database.batchable<sobject>{
    
    //defining Instance Variables
    id oldownerid;
    id newownerid;
    
    //defining Constructor
    public TransferOldSalesRepToNewBatchApex(id oldownerid, id newownerid){
        // since The instance variables and The local Input Parameters Are Same we use 'This' Keyword
        this.oldownerid = oldownerid;
        this.newownerid = newownerid;
    }
    public database.querylocator start(database.batchablecontext bc){
        string query = 'select id,name,owner.Name From Opportunity';
        return database.getquerylocator(query);
    }
    
    public void execute(database.batchablecontext bc,list<opportunity> dealsinbatches){
        //create a list to store The updating opportunities
        list<opportunity> opplist = new list<opportunity>();
        
        //iterate through each batch of opportunities
        for(opportunity opp: dealsinbatches){
            //check if the userid of salesrep leaving is equals to the oldownerid
            if(opp.ownerid == oldownerid){
                //then assign the ownership of the opportunity to the new salesrep who is joining in place of the old salesrep
                opp.ownerid = newownerid;
            }
            
            //Add Each Opportunity That You Have Assignede New SalesRep To The List
            opplist.add(opp);
        }
        //check if our adding Is Succesful or not By using The Isempty Method
        if(!opplist.isEmpty()){
            //Bulk Update The opplist
            update opplist;
        }
}

        public void Finish(database.batchablecontext bc){
            //Lets keep This Optional Since there are no Post process Operations To perform
        }
}