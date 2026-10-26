public class ThisKeywordusage5 {
    // Instance variables
    public String name;
    public String course;
    public Integer fees;
    public Integer discountedfees;
    public Integer feesafterdiscount;

    // Default/No-Argument Constructor
    public ThisKeywordusage5(String name, String course, Integer fees) {
        // Passing the local/input variables to the instance variables
        this.name = name;
        this.course = course;
        this.fees = fees;
    }

    // Instance method to which class-object(instance) is passed as a parameter
    public Integer applydiscount(ThisKeywordusage5 instance, Integer discount) {
        // Calculating and storing the discounted fees
        instance.discountedfees = (instance.fees * discount) / 100;
        //instance.variablename is used as a parmeter so same like this.name = name
        //we used instance.discountedfees = instance.fees*discount/100
        //suppose if fees = 1000;discount = 10 then 1000*10/100 = 100
        //like left side is the value that to be stored in and right one is the value in integer form that is getting converted from percentage
        return instance.discountedfees;
    }

    // Instance method to call the same class method by passing 'this' keyword as a parameter
    public Integer getfeesafterdiscount(Integer discount) {
        // Calling the applydiscount method and storing the result in feesafterdiscount
        this.feesafterdiscount = this.fees - this.applydiscount(this, discount);
        //here this in bracket means the class name and instance that is in the applydiscount(instance,discount) is called here  as an input parameter
        return this.feesafterdiscount;
    }

    // Method to display student details
    public void display() {
        System.debug('=== The Name Of The student is ' + name);
        System.debug('=== The Course Of The student is ' + course);
        System.debug('=== The fees Of The student is ' + fees);
        System.debug('=== The discounted fees Of The student is ' + discountedfees);
        System.debug('=== The fees after discount Of The student is ' + feesafterdiscount);
    }
}