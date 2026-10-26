@istest
public class BillingToShippingTest {
    
    @istest
    public static void test(){
        Account acc = new Account();
        acc.Name = 'Bhujji';
        acc.ShippingCity = 'varanasi';
        acc.ShippingCountry = 'india';
        acc.ShippingPostalCode = '508213';
        acc.ShippingState = 'Kasi';
        acc.ShippingStreet = 'Madhura';

        acc.billingCity = 'Bihar';
        acc.billingCountry = 'india';
        acc.billingPostalCode = '599999';
        acc.billingState = 'Patna';
        acc.billingStreet = 'saraswathi';
        insert acc;
        
        Account acc2 = new Account();
        acc2.Name = null;
        acc2.ShippingCity = null;
        acc2.ShippingCountry = null;
        acc2.ShippingPostalCode = null;
        acc2.ShippingState = null;
        acc2.ShippingStreet = null;
        insert acc2;
        
        Account fetchacc = [select id,Billingcity,billingcountry,billingstreet,billingstate,billingpostalcode,shippingcity,shippingcountry,shippingstate,shippingpostalcode,shippingstreet from Account where id = :acc.Id limit 1];
        system.assertequals('varanasi',fetchacc.ShippingCity);
        system.assertequals('india',fetchacc.ShippingCountry);
        system.assertequals('508213',fetchacc.Shippingpostalcode);
        system.assertequals('kasi',fetchacc.Shippingstate);
        system.assertequals('Madhura',fetchacc.Shippingstreet);
    }

}