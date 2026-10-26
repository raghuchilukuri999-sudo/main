//here we are taking student details as example
//we are going use 'this' keyword as a return type for the instance variables
public class Thiskeywordusage6 {
    //instance variables
    public string name;
    public string course;
    public integer fees;
    public integer discountedfees;
    public integer feesafterdiscount;
    public string companyname;
    public integer ctcoffered;
    
    //Default or No Argument Constructor 
    public Thiskeywordusage6(){
        system.debug('====Default Constructor is called');
    }
    //instance methods to return the same classes instances
    //Here We are using the Classname As the Datatype/return type For the method
    public Thiskeywordusage6 Studentplacementdetails(string name,string course,integer fees,string companyname,integer ctcoffered){
        //here if we observe the instance variable names and the local/input parameter names are same
        //so we used 'this' keyword inorder to distinguish between them
        //also to store local parameters into the instance variables and to make them one 
        this.name = name;
        this.course = course;
        this.fees = fees;
        this.companyname = companyname;
        this.ctcoffered = ctcoffered;
        //here we are going to return the same class instance variables so we use 'this' keyword
        return this;
    }
    //instance method to which class-object is passed as a local/input parameter 
    public integer applydiscount(Thiskeywordusage6 obj, integer discount){
        obj.discountedfees = (obj.fees*discount)/100;
        return obj.discountedfees;
    }
    //instance method to call the same method by passing the 'this' keyword as a input/local parameter
    public integer getfeesdiscount(integer discount){
        feesafterdiscount = this.fees-this.applydiscount(this,discount);
        return feesafterdiscount;
    }
    //Display method To Print The Values
    public void display(){
     system.debug('== The Name of The student is '+name);
     system.debug('== The course of The student is '+course);
     system.debug('== The fees of The student is '+fees);
     system.debug('== The Discountedfees for The student is '+discountedfees);
     system.debug('== The companyName student joined in is '+companyname);
     system.debug('== The ctcoffered to The student is '+ctcoffered);
    }
}