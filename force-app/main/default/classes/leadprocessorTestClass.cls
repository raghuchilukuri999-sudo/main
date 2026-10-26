@istest
private class leadprocessorTestClass {
    
    @TestSetUp
    
    private Static Void SetUpTestData(){
        
        //Creating A list To Store The Inserting Records
        list<Lead> Leadslist = New list<Lead>();
        
        //We Need To creating Numerous Records So We need a loop
        for(integer i = 1;i<=200;i++){
            //Creating an Instnce To Create The New Records
            lead l = new lead();
            l.firstname = 'New Lead First Name'+i;
            l.LastName = 'New Lead last Name '+i;
            l.LeadSource = 'purchasedlist';
            l.company = 'company'+i;
            
            //adding these leads To The List
            leadslist.add(l);
        }
        //checking if Our Adding Is Correctly done Or Not by Checking The List Is Empty or not
        if(!leadslist.isempty()){
            //inserting The Leads Records
            insert leadslist;
        }
    }
    
    //now The Actual Testing Starts 
    
    @istest
    
    private Static Void ActualTesting(){
    
    //calling The batch Apex Class To test Same As How we Did In The Debug
    Test.StartTest();
    
    
    //creating an Instance For The batch Class
    leadprocessor leadbatch = new leadprocessor();
    //here leadprocessor is class name
   //leadbatch is The New batchable class Instance That we Created To call the leadprocessor apex Class

   //Calling Our 'leadprocessor' Apex Class Using 'Database.executebatch(BatchClassInstance,size Of The Batch())'
   //size limit is upto 1 to 200 your wish
   id batchid = database.executebatch(leadbatch,200);
    
    
    Test.StopTest();
    
    //fetching Of The inserted Lead Records To Check If The Leadsource is Updated From Purchasedlist To Dreamforce or not
    list<lead> leadcheckdata = [select id,Firstname,Lastname,Leadsource From Lead Where Leadsource = 'Dreamforce'];
   
    //checking our fetched data that is being Updated Its Leadsource To DreamForce  size With Our Actually Inserted Lead Records
    system.assertequals(200,leadcheckdata.size());
        
    }

}