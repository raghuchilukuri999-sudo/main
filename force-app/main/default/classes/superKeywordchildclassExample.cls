//We call child Class As 'Subclass'
public class superKeywordchildclassExample extends SuperKeywordExampleParentClass {
    //default constructor of child class and 
    //calling the parent class default constructor from the child class constructor we use "super()" for this
    public superKeywordchildclassExample(){ 
        // Call the Parent Class Default Constructor from the Child Class
        //super();
        // Call the Parent Class Parameterized Constructor from the Child Class
        super('Raghu','Chilukuri','Java');
        //we have done both in one step by using 'super()'  and giving values in the brackets from the parent class parameterized constructor
    }
    //Getting The Instance Methods From The Parentclass instance methods And Giving Values to them accordingly
    public override string getstudentname(){
        //here override is the keyword we want to use for every method that we want to use from the parent class instnce method
        //getstudentname is the method name that we have given for this method that came from the parent class methods only
        //calling parent class instance methods to child class instance methods using 'Super' Keyword
        string fullname = super.getstudentname();
        system.debug('===The Full Name Of the Student is===' + fullname);
        return fullname; 
    }
    //similar to the top one
    public override string getstudentjoinedcourse(){
        string coursename = super.getstudentjoinedcourse();
        system.debug('===The Course Name Of the Student is==='+ coursename);
        return coursename;
    }
    //Printing the Values using The Display Method
    public void display(){
        // Calling Parent Class Variables from Child Class
        system.debug('===The First Name of the Student is=====' + super.firstName);
        system.debug('===The Last Name of the Student is=====' + super.lastName);
        system.debug('===The Course in which Student has joined is=====' + super.course);
    }

    
}