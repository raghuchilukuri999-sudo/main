public class interfacechild implements interfaceparent {
    
    //since interface is not a class we cant extend it but we can implement the methods in the interface here thats it
    
    //variables
    public string carname;
    public string carmodelnumber;
    public integer carprice;
    
    //constructor
    public interfacechild(string carname,string carmodelnumber,integer carprice){
        this.carname = carname;
        this.carmodelnumber = carmodelnumber;
        this.carprice = carprice;
    }
    
    //methods implementation
    public string getcarname(){
        return carname;
    }
    public string getcarmodelnumber(){
        return carmodelnumber;
    }
    public integer getcarprice(){
        return carprice;
    }

}