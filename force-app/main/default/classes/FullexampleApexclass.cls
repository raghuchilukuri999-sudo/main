public class FullexampleApexclass {
    
    
    //can be used anywhere outside class/we use. object for this i.e object.variable
    public string name = 'raghu';//can be called from anywhere in the org
    
    private integer age = 25;// cant be called into anonmous window too
    //global decimal percent = 99.99;//at top also we need to use global for the class so, presently i'm commenting it and even we can ue it in extrenal purpose also
    protected boolean isvirgin = true; //accepted in classes and subclasses thats it
    
    
    //inside the class and can be called using classname.variable
    public static string sistername = 'chilukurilaxmi';
    private static integer sisterage = 20;
   // global static decimal sistermemory = 100.00;
    /*protected static boolean isfemale = true;there will be no static protected varibale existance */
    
    
    public string companyname;
    private integer salary;
   // global decimal satisfactionpercent;
    protected boolean isallok;
    public string college;
    public integer yearsofcollege;
    
    public static string schoolname;
    private static integer studiedyears;
   // global static decimal schoolpercent;
   // protected static boolean isgoodschool;
     
   
    public FullexampleApexclass(){
        system.debug('this is a non param contsructor');
        
        //pasing values to the instance variables from constructor
        this.companyname = 'activeminds';
        this.salary = 232122;
        //this.satisfactionpercent = 0; // this can be done if its global at class too
        this.isallok = false;
        
        //passing the values to static variables from constructor but,the constructoir cannot be static 
      //  this.schoolname = 'new vision high school'; // the constructor also should be static for this but,the contsructor cannot be static 
      //  this.studiedyears = 10; // the constructor should also be static 
        //this.schoolpercent = 100; // actually we only do this if class is also global
        //this.isgoodschool = false; // protected can't be for static 
    }


//partial param constructor
    public FullexampleApexclass(string collegename,integer collegeage,string schoolname,integer studiedyears){
      this.college = collegename;
      this.yearsofcollege = collegeage;

     /* this.schoolname = schoolname+'Nvhs';
      this.studiedyears = studiedyears+11; this cant be done be here becz those are static things and cannot be passed
      values from a constructor and can be defined values only from a static method*/
      

    }


    //public instance methods
    public void instancemethods(string param){
      system.debug('===this is a instance method==');
      system.debug('this is a isntance varibale so calling from a instnace nethod'+name);
      //private and static cannot be called here
      this.companyname = param;

    }

    //private instance methods
    private void privateinstancemethod(integer sal){
      this.salary = sal;
      system.debug('the self declared private vribale is ==='+age);

    }

    //protected and global will be to thier resprected values

    //public static methods
    public static void publistaticmethod(string staticstringvale){
      schoolname = staticstringvale;//this cannot be used in static methods
      system.debug('the statiuc method values'+sistername);


    }

    //private static methods
    private static void privatestaticmethod(integer intstaticval){
      studiedyears = intstaticval;//this cannot be used in static methods
      system.debug('the static method values private'+sisterage);
    }

    //protected and global will be according to thier respected


    //getter and setter
public string getcompanyname(){
  system.debug('==this is a getter method==');
  return this.companyname;
}

public void setcompanyname(string val){
  system.debug('===this is a setter method==');
  this.companyname = val;

}

//getters and setters indirectly or property getter

    // ---------------------------------------------------------------------
    // BACKING VARIABLE for companyName2
    // This is the actual storage location.
    // The property (companyName2) will read/write to this field.
    // ---------------------------------------------------------------------
    private String companyName2Field;



    // ---------------------------------------------------------------------
    // FULL PROPERTY FOR companyName2
    //
    // IMPORTANT NOTES:
    //
    // 1. Property name has NO parentheses:
    //        public String companyName2 { ... }
    //
    // 2. Getter runs when you READ the property:
    //        String s = obj.companyName2;
    //
    // 3. Setter runs when you ASSIGN to the property:
    //        obj.companyName2 = 'ABC';
    //
    // 4. 'value' = whatever you assigned.
    //
    // EXAMPLE:
    //      obj.companyName2 = 'TCS';
    //
    // Apex internally calls:
    //      companyName2.set('TCS');
    //
    // Inside the setter, 'value' = 'TCS'
    // ---------------------------------------------------------------------
    public String companyName2 {
        get {
            System.debug('=== GETTER CALLED FOR companyName2 ===');

            // Return the stored value
            return this.companyName2Field;
        }

        set {
            System.debug('=== SETTER CALLED FOR companyName2 ===');

            // 'value' automatically contains whatever was assigned
            // Example:
            // obj.companyName2 = 'Wipro';
            // value = 'Wipro'
            this.companyName2Field = value;
        }
    }



    // ---------------------------------------------------------------------
    // HOW YOU TEST THIS IN ANONYMOUS WINDOW:
    //
    // FullPropertyExample f = new FullPropertyExample();
    //
    // f.companyName2 = 'Infosys';   // setter runs, value = 'Infosys'
    // String result = f.companyName2; // getter runs, returns 'Infosys'
    //
    // System.debug(result);          // prints 'Infosys'
    // ---------------------------------------------------------------------

//or simple way
public string companyname3{get;set;}


   


    
    
    
    
     
    
    

}