public class DmlPracticeInsert {

    public static void Accinsert(){
        
        // There is a validation rule on Account that enforces unique Account Names.
        // If we use the same Account Name every time while executing from Anonymous Window,
        // Salesforce throws a validation error because that Account already exists.
        //
        // To avoid manually changing the Account Name during every execution,
        // we use System.currentTimeMillis() which generates a unique timestamp value.
        // This makes each Account Name unique for every execution.

        Account acc = new Account();

        acc.Name = 'Testing Acc ' + System.currentTimeMillis();
        acc.Industry = 'Energy';
        acc.NumberOfEmployees = 2500;
        acc.AnnualRevenue = 5000000000.0;

        insert acc;

        System.debug('Single Account Inserted: ' + acc);
    }

    public static void AccBulkInsert(){

        List<Account> acclist = new List<Account>();

        for(Integer i = 1; i <= 10; i++){

            Account acc2 = new Account();

            acc2.Name = 'Testing Acc2 ' + i;
            acc2.Industry = 'Energy';
            acc2.NumberOfEmployees = 2500;
            acc2.AnnualRevenue = 5000000000.0;

            acclist.add(acc2);
        }

        if(!acclist.isEmpty()){
            insert acclist;
        }

        System.debug('Bulk Accounts Inserted: ' + acclist);
    }
}