// emp is the class name
public class Employee {
// next we need to create the variables/properties for the class that we created  
// we have 3 types of variables instance,static,local
// instance variable-this should be inside a class and should be outside a constructor or method or block "ex:  public string name;"
// static variable-this should be inside a class and should be outside a constructor or method or block "ex:public static string name;"
// local variable-this should inside a class and method or block or constructor "ex: "
   
// examples for instance varibales    
    public string name;
    public integer age;
    public integer salary;
    public string designation;
    
// examples for static variables
    public static string companyname;
    
// we are using constructor to pass the intial  values to the object
// i.e name,age,salary,designation to get reflected in the object we use a constructor 
    Public Employee(){
         system.debug('===This is a constructor==='); // This is The Default Constructor
         system.debug('====name of the Employee is'+ name); // These are Non-parameterized constructors
         system.debug('====age of the Employee is'+ age);
         system.debug('====salary of the Employee is'+ salary);
         system.debug('====designation of the Employee is'+ designation);
         system.debug('====companyname of the Employee is'+ companyname);
}
    //now we want to 
    

}