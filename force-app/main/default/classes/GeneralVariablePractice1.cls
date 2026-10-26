public class GeneralVariablePractice1 {
    
    public void executemethod(){
    
String employeename = 'raghu Sharma';
Integer employeeage = 25;
Boolean IsMarried  = false;
Date    dateofbirth = date.newinstance(2000,02,24);
Datetime joiningdateofoffice = datetime.newinstance(2025,01,10,3,30,60);
//id employeeid = 'ACTMIN563262890789';
    /*   15 Character Id ==> Case Sensitive ==> Used Internally in Salesforce
18 Character Id ==> Case Insensitive  ==> Used when Integrating 
Salesforce with other systems.*/
    long EmployeeAnnualincome = 2200000L;
    decimal EmployeeAttendance = 99.99;
    double employeeworkhonesty = 99.99999999D;
    Time EmployeeOfficeClosing = time.newinstance(07,00,00,00);
    
    
    System.debug('The Employeename is'+employeename);
    system.debug('the employeeageis'+ employeeage);
    system.debug('is the employee married'+ismarried);
    system.debug('employee birthdate'+dateofbirth);
    system.debug('employee office join date'+joiningdateofoffice);
      //  system.debug('Employeeid'+ employeeid);
        system.debug('employeeannualincome'+employeeannualincome);
        system.debug('employeeattendance'+employeeattendance);
        system.debug('employeeworkhonesty'+employeeworkhonesty);
        system.debug('employeeofficeclosingtime'+employeeofficeclosing);
    
    }


}