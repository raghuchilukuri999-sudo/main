//when the input/local parameters are same as the instance variables
//at such time to refer the current class instance we use 'this.' keyword
public class THISkeyword1stusage {
    //instance variables related to students
    public string name;
    public string branch;
    public integer feespaid;
    //parameterized constructor
    public THISkeyword1stusage(string name,string branch,integer feespaid){
            //here if you observe the local/input parameter names in constructor is as same as the instance variables
            //so to make it easy for the code we use 'this' keyword to 'instance variables'
            //while passing the local variables to the instance variables
        This.name = name;
        This.branch= branch;
        This.feespaid = feespaid;
    }
    //instance display method
    //here in display we use instance variables in print statement but no need of using 'This' keyword here
    //becz now the local variables are merged/stored in instance variables so only
    //one name,branch,feespaid is there as the names
    public void display(){
        system.debug('====The Name Of The Student is===' + name);
        system.debug('====The branch Of The Student is===' + branch);
        system.debug('====The fee paid by the Student is===' + feespaid);
        
    }

    
}