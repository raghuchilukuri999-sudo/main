@istest
public class PatientPracticetestClass {
    
    @istest
    public static void Testing(){
        //calling static method here
        patientpractice.ChangeAge();
        
        //initialize
        patientpractice pp = new patientpractice('Maha','+91677323232');
        pp.display();
        system.assertequals(60,patientpractice.Age);
        
        
    }    

}