@istest
public class AutocreateContractAsyncTest {
    
    @istest
    public static void unitTest(){
        
        //use this method in an apex test so that changeEvent notifications are generated for all supported changeDatacapture Entities
        //call this method at the beginning of your test before performing dml operations and calling Test.getEventBus().deliver()
        Test.EnableChangeDataCapture();
        //create an Account
        account acc = new account();
        acc.name = 'cognizant';
        acc.industry = 'Technology';
        insert acc;
        
        //create an opportunity for the customer
        opportunity opp = new opportunity();
        opp.name = 'mulesoft training deal';
        opp.StageName = 'prospecting';
        opp.CloseDate = date.newinstance(2024,02,25);
        opp.Amount = 300000;
        opp.Accountid = acc.id;
        insert opp;
        
        contract cr = new contract();
        cr.Accountid = acc.id;
        cr.status = 'Draft';
        cr.StartDate = Date.newinstance(2024,08,13);
        cr.ContractTerm = 12;
        insert cr;
        
    }

}