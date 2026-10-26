//we call the parent class as 'super class'
public virtual class SuperKeywordExampleParentClass {
    //instance variables
    public string firstname;
    public string lastname;
    public string course;
    //Default Constructor
    public SuperKeywordExampleParentClass(){
        //passing the values to the instance variables
        firstname = 'Raghu';
        lastname = 'Chilukuri';
        course = 'Java';
        system.debug('===The Parent Class Default Constructor===');
        system.debug('===The firstname of The student is===' + firstname);
        system.debug('===The lastname of The student is===' + lastname);
        system.debug('===The Course Took By The student is===' + course);
    }
    //parameterized constructor
    public SuperKeywordExampleParentClass(string stdfirstname,string stdlastname,string stdcourse){
        //here local/input parmeters Names Is being Given Different From The instance variables names
        //so no need of using 'This' Keyword For Instance Variables
        //pass the local/input parameters to the instance variables
        firstname = stdfirstname;
        lastname = stdlastname;
        course = stdcourse;
        system.debug('====The Parent Class Parameterized Constructor');
        system.debug('===The FirstName Of The Student Class is' + firstname);
        system.debug('===The lastname of The student is===' + lastname);
        system.debug('===The Course Took By The student is===' + course);
    }
    //instance methods
    public virtual string getstudentname(){
        string fullname = firstname + '' + lastname;
        return fullname;
    }
     public virtual string getstudentjoinedcourse(){
        return course;
    }
    

}