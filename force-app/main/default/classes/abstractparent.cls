public abstract class abstractparent {
    
    //instance variables
    public string carname;
    public string carmodelnumber;
    public boolean hasrooftop;
    public integer carprice;
    
    //constructor
    public abstractparent(string carname,integer carprice,string carmodelnumber){
        this.carname = carname;
        this.carprice = carprice;
        this.carmodelnumber = carmodelnumber;
    }
    
    //abstract methods
    public abstract string getcarname();
    public abstract integer getcarprice();
    public abstract string getcarmodelnumber();
    
    //normal methods in an abstract class
    public boolean gethasrooftop(){
        return true; //but this will be only upto this method not to the whole class 
    }


}