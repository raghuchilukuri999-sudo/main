public class CustCarTestDriveDateRemainderHandler {
    
    public static void NotifyCustomersAboutTestDriveStartDate(){
        
        //create a list To store the ToAddresses
        list<string> toaddresses = new list<string>();
        //create a list to store The ccAddresses
        list<string> ccAddresses = new list<string>();
        //create a list to store the bccAddresses 
        list<string> bccAddresses = new list<string>();
        //create A list To store The singleMailMessages
        list<Messaging.singleEmailMessage> MasterMailslist = new list<Messaging.singleEmailMessage>();
        
        //fetch all The customers who have been Allocated to a CarType And Which Test Drive is Going to start Tommorow
        list<customer__c> custfetch = [select id,Name,Customer_Email__c,Mentor_For_Customers__r.Email,owner.Email,Car_type__c From Customer__c 
                                       where car_Type__c != null And car_Test_Drive_Start_Date_On__c = TOMORROW];
        //Iterate Through The Fetched Customers
        for(customer__c cust :  custfetch ){
            //check if the Customer Email Is Not Null
            if(cust.Customer_Email__c != null){
                //Add The Customer Email ids  To The ToAddresseslist
                toAddresses.add(cust.Customer_Email__c);
            }
            //check if The Customer Mentor Has an Email
            if(cust.Mentor_For_Customers__r.Email != null){
                //Add Mentor Email ids To The ccAddresses
                ccAddresses.add(cust.Mentor_For_Customers__r.Email);
            }
            //check if The customer owner Has an Email
            if(cust.owner.Email != Null){
                //Add Owner Email Ids To The BccAddresses
                bccAddresses.add(cust.owner.Email);
            }
            
            //create an instance of singleEmailMessage class
            Messaging.singleEmailMessage singleMail = new Messaging.singleEmailMessage();
            //set The People In ToAddresses list
            singleMail.SetToAddresses(toaddresses);
            //set The People in ccAddresses list
            singleMail.setccAddresses(ccAddresses);
            //set the People in BccAddresses list
            singleMail.setbccAddresses(bccAddresses);
            //set The sender Details
            singleMail.setsenderDisplayname('stead fast Technologies');
            //set The Reply Email
            singleMail.setReplyTo('SteadFastTechologies.2022@gmail.com');
            //set The Subject
            singleMail.setsubject('The Car Type test Drive Date Remainder');
            
            //construct The body Of The Email
            string body = 'hello Thank You For Choosing The Car For Test Drive';
                
            //set The Body
            singleMail.setPlainTextBody('');
            
            //Add Each Mail To The Master list
            MasterMailslist.add(singleMail);
        }
        //check If There are any Mails In The List
        if(!MasterMailslist.IsEmpty()){
            //send Mails In Bulk
            Messaging.SendEmail(MasterMailslist);
        }
    }

}