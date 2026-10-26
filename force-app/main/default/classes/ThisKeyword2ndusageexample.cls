//This 2nd usage is all About Calling/invoking one Method From The Other Methods When Both are In The Same Class
//In the Method FRom which We are invoking We use 'This' Keyword For The Method Which We are Invoking
public class ThisKeyword2ndusageexample {
    //instance variables
    public string name;
    public string branch;
    public integer fees;
    public integer discount;
    public integer percentageofmarks;
    public integer feesafterdiscount;
    
    //Non-parmeterized Constructor
    
    public ThisKeyword2ndusageexample(){
        system.debug('===ThisKeyword2ndusageexample constructor is called');
    }
    //instance methods
    
    //Here i want to use/invoke/call those instance variable names from the instance methods
//by passing local/input parameters into the instance variables
//so as to differentiate them both we use 'this' keyword for the instance variables in the instance methods

    
    //Instance Methods To Potray The Dicount Percentage That Have been given To the Students Based n their Percentageofmarks
    //To calculate This we Just need Percentageofmarks of Students
    public integer getdiscount(integer percentageofmarks){
        This.percentageofmarks = percentageofmarks;
        
        //check if the student percentageofmarks is in between 90 and 100
        if(This.percentageofmarks >= 90 && This.percentageofmarks <= 100){
            //then give 50percent discount to that student
            This.discount = 50;
        }
        //check if the student percentageofmarks is in between 80 and 90
        else if(This.percentageofmarks >=80 && This.percentageofmarks <= 90){
            //then give 20percent discount to that student
            This.discount = 20;
        }
        //check if the student percentageofmarks is in between 60 and 80
        else if(This.percentageofmarks >=60 && This.percentageofmarks < 80){
            //then give 10percent discount to that student
            This.discount = 10;
        }
        //if any of these is not happened then NO discount will be provided For the student
        else{
            This.discount = 0;
        }
        return discount;
        
    }
    
    //instance methods to calculate Fees after Discount
    //To Calculate This we need fees and percentageofmarks of students also
    public integer getfeesafterdiscount(integer fees,integer percentageofmarks){
        //passing the local/input parameters To the Instance Variables using 'This' keyword For The Instance Variables
        This.fees = fees;
        //calling The Same Class Method Using 'This' Keyword
        //That is We are invoking/calling one Method(getdiscount) into other Method (getfeesafterdiscount)
        //and both are in the same class Thats The Reason We use 'This' Keyword In method in which we want To call the other method 
        //That to for the invoked method
        // but,here you may or maynot use that upto you the result will be same in both cases
        //but,the compiler will anyways add the 'This' keyword in The Background
        integer feesafterdiscount = fees - (fees*This.getdiscount(percentageofmarks)/100);
        return feesafterdiscount;  
    }
    
}