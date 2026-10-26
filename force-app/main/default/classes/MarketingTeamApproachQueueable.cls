public class MarketingTeamApproachQueueable implements database.batchable<sobject> {
    
    public database.querylocator start(database.batchablecontext bc){
        string query = 'select id,Name,Team_Member_Approched_cust_on__c,Team_member_approched_cust_status__c from Marketing_Team__c'+
            'where Team_Member_Approched_cust_on__c <= Today And Team_member_approched_cust_status__c != \'Approched and Customer is interested\'';
        return database.getquerylocator(query);
    }
    
    public void execute(database.batchablecontext bc,list<Marketing_Team__c> processedRecordsinbatches){
        for(Marketing_Team__c MarkTeamFetch : processedRecordsinbatches){
            MarkTeamFetch.Team_member_approched_cust_status__c = 'Approched and Customer is interested';
        }
        update processedRecordsinbatches;
    }
    
    public void finish(database.batchablecontext bc){
        //call The Queueable class From This
    }
    

}