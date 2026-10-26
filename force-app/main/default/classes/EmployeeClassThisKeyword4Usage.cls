public class EmployeeClassThisKeyword4Usage {
    public CompanyclassThiskewyword4Usage company;
    //here the other  class's classname/objectname is used as a Data type For This Class

    // Parameterized constructor
    public EmployeeClassThisKeyword4Usage(CompanyclassThiskewyword4Usage company) {
        //here The Constructor Name Is This Class Name only
        //where In the Constructor To Provide input/Local Parameters Values we used 
        //CompanyclassThiskewyword4Usage(other class's name ) as a data type
        //and given our value
        this.company = company;
        System.debug('=== Employee is associated with the company: ' + company.name);
        //here we are printing our the employee company name based on the class 
        //becz employee will be allocated to a company
        //so company is our variable and name is in the other class
        //we have joining them both and getting our company name
    }

}