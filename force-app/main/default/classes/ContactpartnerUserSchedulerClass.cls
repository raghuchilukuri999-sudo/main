public class ContactpartnerUserSchedulerClass implements schedulable {
    
    public void execute(schedulablecontext sc){
        //calling the CreatecontactPartnerUserHandler Class and its Method
        CreatecontactPartnerUserHandler.createContactPartnerUser();
        //since its a static method we use its class name and the method
        
    }

}