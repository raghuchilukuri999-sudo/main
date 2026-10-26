public class SGRecEG {
    
//defining variables
decimal length,breadth;

    //constructor without parameters 
    public SGRecEG(){
        length = 5;
        breadth = 6.6;
    }
        
    
    //methods 
    public void area(){
        decimal a = length*breadth;
        system.debug('printing the area='+a);
    }
      public void perimeter(){
        decimal p = 2*(length+breadth);
        system.debug('printing the perimeter='+p);
    }

}