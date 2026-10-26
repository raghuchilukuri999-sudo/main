public class abstractchild extends abstractparent{
    
    //constructor of child class
    public abstractchild(string carname,integer carprice,string carmodelnumber){
        
        super(carname,carprice,carmodelnumber);
        //here calling the parent class constructor variables into child class constructor
        //its indirectly like assigning locl variables of this class to the instance variables of the parent class becz both are now in relation
        
    }
    
    //calling parent abstract methods here but not assigning 
    //values to them becz we are making them universal such thatwe can provide any value in the test class
    public override string getcarname(){
        return carname;
    }
    public override string getcarmodelnumber(){
        return carmodelnumber;
    }
    public override integer getcarprice(){
        return  carprice;
    }

}