@isTest
private class MultiObjectIterableBatchApexTestClass {
    
    @TestSetup
    private static void TestSetupData(){
        
        Account acc = new Account(Name = 'Balellaka');
        insert acc;
        
        // Create a list to store the bulk Opportunities
        List<Opportunity> opplist = new List<Opportunity>();
        
        // Create a list to store the bulk Cases
        List<Case> caselist = new List<Case>();
        
        // Create a loop to create bulk Opportunities
        for(Integer i = 1; i <= 200; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Vadiyala' + i;
            opp.StageName = 'Needs Analysis';
            opp.CloseDate = Date.newInstance(2024, 3, 3);
            opp.AccountId = acc.Id;
            opplist.add(opp);
        }
        
        if(!opplist.isEmpty()){
            insert opplist;
        }
        
        // Create a loop to create bulk Cases
        for(Integer i = 1; i <= 200; i++){
            Case cs = new Case();
            cs.SLAViolation__c = 'no';
            cs.IsEscalated = false;
            cs.Status = 'Escalated';
            cs.AccountId = acc.Id;
            caselist.add(cs);
        }
        
        if(!caselist.isEmpty()){
            insert caselist;
        }
    }
    
    @isTest
    public static void ActualTest(){
        
        Test.startTest();
        // Calling the Batch Class by creating an instance
        MultiObjectIterableBatchApex batchInstance = new MultiObjectIterableBatchApex();
        Id batchId = Database.executeBatch(batchInstance, 400);
        Test.stopTest();
        
        List<Opportunity> oppQuery = [SELECT Id, Name, StageName, CloseDate, IsClosed, AccountId FROM Opportunity WHERE StageName = 'ClosedLost'];
        List<Case> csQuery = [SELECT Id, CaseNumber, Status, IsEscalated, SLAViolation__c, AccountId FROM Case WHERE IsEscalated = true];
        
        System.assertEquals(200, oppQuery.size());
        System.assertEquals(200, csQuery.size());
    }
}