//This Example Is all About Using 'this' Keyword In The Constructors and Invoking/Calling Deafault Constructor From Parameterized constructor In The Debugging stage
//this will be only work when Both the constructors belongs to the same class
//and here we have taken example for a student
//and we have to use 'This()' on the Parameterized constructor so as to call the default constructor
public class Thiskeywordusage3example {
    //instance variables
    public string name;
    public string branch;
    public integer marksscored;
    public integer totalmarks;
    //Default constructor (Non-parameterized constructor)
    public Thiskeywordusage3example(){
        //here just giving value for the totalmarks directly
        totalmarks = 1000;
        system.debug('===Default constructor is called===');
    }
    //parameterized constructor
    public Thiskeywordusage3example(string name,string branch,integer marksscored){
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
    //printing the values using the Display method
    public void display(){
         system.debug('===The Name Of The Student is===' + name);
         system.debug('===Branch Of The Student Is===' + branch);
         system.debug('===Marksscored by the Student Are===' + marksscored);
         system.debug('===Marksscored by the Student Are===' + totalmarks);
        
    }

}