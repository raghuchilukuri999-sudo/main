//Reusing Constructor/Constructor Chaining: By Using 'This'
//That means Calling/invoking one Constructor From Other and other Called By Another
// In This Example: calling Default Constructor From Parameterized Constructor1  by using 'this' keyword in parameterized constructor1 
//and calling Parameterized constructor1 from the Parameterized constructor2 by using 'this' keyword in parameterized constructor2
//All this Can Be Done by using 'This' Keyword on the invoking constructor
//and for that all the constructors should be in the same class

public class ConstructorChainingExample {
    //instance variables
    public string name;
    public string branch;
    public integer marksscored;
    public integer totalmarks;
    public string companyname;
    public integer ctcoffered;
    //Default constructor (Non-parameterized constructor)
    public  ConstructorChainingExample(){
        //here just giving value for the totalmarks directly
        totalmarks = 1000;
        system.debug('===Default constructor is called===');
    }
    //parameterized constructor
    public  ConstructorChainingExample(string name,string branch,integer marksscored){
        //passing values of local/input parameters to the instance variables
        //if you observe the instance variable names and the local/input parameters names are same
        //so,we need to use 'this' keyword for the instance varaible names inorder to make it easy for coding
        //by storing local/input parameters into insatnec variables and making them into one name
        This();
        // here This(); will bring the Default constructor To the parameterized constructor
        This.name = name;
        This.branch = branch;
        This.marksscored = marksscored;
    }
    //parameterized constructor2
    public  ConstructorChainingExample(string companyname,integer ctcoffered){
        This('Raghu','Civil',560);
        This.companyname = companyname;
        This.ctcoffered = ctcoffered;
    }
    //printing the values using the Display method
    public void display(){
         system.debug('===The Name Of The Student is===' + name);
         system.debug('===Branch Of The Student Is===' + branch);
         system.debug('===Marksscored by the Student Are===' + marksscored);
         system.debug('===Marksscored by the Student Are===' + totalmarks);
         system.debug('===Companyname Student Placed in ===' + companyname);
         system.debug('===ctcoffered for the student===' + ctcoffered);  
    }
}