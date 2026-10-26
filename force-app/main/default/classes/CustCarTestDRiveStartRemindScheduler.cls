public class CustCarTestDRiveStartRemindScheduler implements schedulable{
    
    public Void Execute(schedulablecontext sc){
        //calling The Handeler Class and its Method such That The Email Notifiation can Be scheduled
        //since its an static method We call using The Handler Class Name And Its Method
         CustCarTestDriveDateRemainderHandler.NotifyCustomersAboutTestDriveStartDate();
    }

}