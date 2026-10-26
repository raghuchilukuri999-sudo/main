public class Laptop {
    //instance variables
    public String Color;
    public String model;
    public Integer processornumber;
  // when we provide values for instance varibles in the constructor itself in the class  
    public Laptop() {
        Color = 'Black'; // Initialize the color
        model = 'Acerpredator'; // Initialize the model
        processornumber = 76697; // Initialize the processor number
    }
    // displaying/printing the values that are given to the instance variables in constructor using display method/function ()
    public void display() {
        System.debug('Laptop color: ' + Color);
        System.debug('Laptop model: ' + model);
        System.debug('Processor number: ' + processornumber);
    }
    // instance methods to display the action that a laptop can do
    public void Gaming(){
        system.debug('The Laptop Is Compatible With Gaming');
    }
     public void Editing(){
        system.debug('The Laptop Is useful For Editing');
    }
     public void Coding(){
        system.debug('The Laptop Is Helpful For Coding');
    }
}