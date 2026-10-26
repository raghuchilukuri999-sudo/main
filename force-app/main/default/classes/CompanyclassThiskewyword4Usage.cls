public class CompanyclassThiskewyword4Usage {
    //here CompanyclassThiskewyword4Usage is the class Name
    public String name;

    // Parameterized constructor
    public CompanyclassThiskewyword4Usage(String companyName) {
        //here CompanyclassThiskewyword4Usage is used as the constructor name
        //becz class name will be the contructor name
        this.name = companyName;
    }
EmployeeClassThisKeyword4Usage obj1 = new EmployeeClassThisKeyword4Usage(this);
    //We have an instance variable name to store the company name.
//The constructor takes a String parameter companyName and assigns it to the instance variable name

}