@istest
private class updateshippingAddresstestclass {
    @istest
    private static void unittest(){
        Account acc = new Account();
        acc.Name = 'Bhargava';
        acc.Billingstreet = 'Chennaivadalam';
        acc.Billingcity = 'chennai';
        acc.Billingcountry = 'India';
        acc.BillingpostalCode = '500153';
        acc.Billingstate = 'Tamilnadu';
        
        insert acc;
        
        //fetch the details that you have provided
        Account iacc = [select id,Billingstreet,Billingcity,Billingcountry,BillingpostalCode,Billingstate,shippingstreet,shippingcity,shippingcountry,shippingpostalCode,shippingstate from account where id =: acc.id limit 1];
        //check if the Given billing address Values reflects in the shiooing address or not
        system.assertequals('Chennaivadalam',iacc.shippingstreet);
        system.assertequals('chennai',iacc.shippingcity);
        system.assertequals('India',iacc.shippingcountry);
        system.assertequals('500153',iacc.shippingpostalcode);
        system.assertequals('Tamilnadu',iacc.shippingstate);
    }

}