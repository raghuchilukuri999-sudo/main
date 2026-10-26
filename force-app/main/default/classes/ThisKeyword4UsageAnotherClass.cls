// This class will be used as a constructor name for another class, i.e., ThisKeywordUsage4 (student class).
// Using 'this' keyword in the constructor of that class.
// Here we are taking details related to a company.
public class ThisKeyword4UsageAnotherClass {
    // Instance variable
    public String name;
    // Here 'name' is the company name.
    
    // Parameterized constructor
    public ThisKeyword4UsageAnotherClass(String cmpname) {
        this.name = cmpname;
        // Here local/input parameter names are different, so no need to use the 'this' keyword here.
        
        // Passing 'this' keyword as an input/local parameter to the constructor.
        // We are creating an object/instance.
        // In which the other class name is given as the constructor name and
        // in the input parameters of that constructor, we have given this class constructor.
        // Such that with that constructor, we are going to call this constructor also in the debugging.
        ThisKeywordUsage4 obj = new ThisKeywordUsage4(this);
    }
}