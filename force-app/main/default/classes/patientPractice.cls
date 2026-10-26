public class patientPractice {
    
    //instance variable
    String patientName;
    string PatientorRelatedMobile;
    
    //Static variable Which Will be Unchnaged throughout to make it test visible add @TestVisible
    @testVisible Static integer Age = 45;
    
    //static Method
    public static void changeAge(){
        //changing the unchangable
        Age = 60;
    }
    
    //constructor to pass values(param constr)
    public patientPractice(string Name,string MobileNumber){
        //passing Params
        this.patientname = Name;
        this.patientorRelatedMobile = MobileNumber;
    }
    //displaying
    public void display(){
        System.debug('===The name of the patient=='+patientName);
        System.debug('===The Mobile of the patient=='+PatientorRelatedMobile);
        System.debug('===The Age of the patient=='+ Age);
    }
    
    

}