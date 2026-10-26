//Here we are using 'This()' In The Default Constructor In Order To call Parameterized Constructor From The Default Constructor
//But Both The constructors should Belong To the same Class
public class ThisKeywordusage3Example3 {
     //instance variables
    public string name;
    public string branch;
    public integer marksscored;
    public integer totalmarks;
    //Default constructor (Non-parameterized constructor)
    public ThisKeywordusage3Example3(){
        //here just giving value for the totalmarks directly
        This('Raghu','civil',560);
        // here This(); will bring the Parameterized constructor To the Default constructor
        totalmarks = 1000;
        system.debug('===Default constructor is called===');
    }
    //parameterized constructor
    public ThisKeywordusage3Example3(string name,string branch,integer marks){
        //passing values of local/input parameters to the instance variables
        //if you observe the instance variable names and the local/input parameters names are same
        //so,we need to use 'this' keyword for the instance varaible names inorder to make it easy for coding
        //by storing local/input parameters into insatnec variables and making them into one name
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