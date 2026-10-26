public class studentgettersetterexample {

    //insatnce variables

    private string name;
    private string studentid;
    private string branch;
    
    //static variable 
    public static string collegename = 'sri Durga College';
    // this is a static variable example
    // The Static Variable Should be Provided With A Value So CollegeName = 'sri durga college
    // As College is Only One so we used 'Static' But It will be Available For All So we used 'Public'
    // remaining all variables may change so we used instance and that too we can keep it in 'private'
    // because student details are individual and personal                                                                                                        
                                                       

          
    //I just Want To Change The Static Variable Value i.e Name Of the College
    // That Means Here We are Performing Action i.e nothing but 'Method'(or)'Function'
   // here we used static variable so, we need to use 'static method'
       
    public static void changecollegename(){
        collegename = 'Sri Nava Durga College';
        System.debug('The College Name Is ' + collegename);
    }
     
    //creating constructor without the instance variable values
    
    public studentgettersetterexample(){
        system.debug('===The student Details Are===');
    }
    
    //As we Have Taken Insatnce Variable Values as Private 
    //We need To use Getter and Setter Methods To Allocate Values for Them And To Get Those Those Values
    
    //setter methods
    
    public void setname(string Studentname){
        name = StudentName;
    }
    
    // here setname is keyword used to set the values for the instance variable 'name' and the value type is 'string'
    // the value that we are setting for 'name' is 'Studentname'
    // as there is no return type for setting we use 'void'
    
    public void setstudentid(string StudentidNumber){
       studentid  = StudentidNumber;
    }
    
    public void setbranch(string Studentbranch){
        branch = Studentbranch;
    }
     //getter methods
    
    public string getname(){
        return name;
    }
    public string getstudentid(){
        return studentid;
    }
    public string getbranch(){
        return branch;
    }
    
    //Displaying The Results
    
    public void display(){
        system.debug('The Name Of The Student Is ' + getname());
        system.debug('the Id Of The student is' + getstudentid());
        system.debug('The Branch Of The Student Is ' + getbranch());
        system.debug('the name of the college is ' + collegename);
      
    }  
}