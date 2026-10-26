@isTest
private class TransferOwnershipTestClass {

    @Testsetup
    public static void setupTestData(){
        List<Opportunity> opplist = new List<Opportunity>();
        for(integer i=1 ; i<=200 ; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Nr'+ i;
            opp.CloseDate = date.newinstance(2024,01,05);
            opp.StageName = 'Prospecting';
            opplist.add(opp);
        }
        if(opplist.size()>0 && !opplist.isEmpty()){
            insert opplist;
        }
    }
    @isTest
    private static void unitTest(){
        test.startTest();
        //Passing The id in The Url of The OldSalesRep 
         id oldownerid = '005IR00000F1tMHYAZ';
         //passing The Id In The URl Of The NewSalesRep
        id newownerid = '005IR00000EwxDjYAJ';
        //calling The Instance of The Batch Apex
         TransferOldSalesRepToNewBatchApex batchinstance = new TransferOldSalesRepToNewBatchApex(oldownerid,newownerid);
        id batchid = database.executebatch( batchinstance,200);
        test.stopTest();
    }

}