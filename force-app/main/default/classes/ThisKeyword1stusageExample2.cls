public class ThisKeyword1stusageExample2 {
    //This Is The Example Of Using 'This'keyword when Local/input parameters And instance variable names are different
    //and in this type of scenerio you may or maynot use 'This' keyword That is upto you
    
    //instance variables
    public string coursename;
    public integer coursefees;
    public integer courseduration;
    
    //parameterized constructor
    public ThisKeyword1stusageExample2(string name,integer fees,integer duration){
        //here if you observe Local/input parameters And instance variable names are different
        //so here you may or may not use 'this' keyword thats upto you
        //but,The Results will be the same
        coursename = name;
        coursefees = fees;
        courseduration = duration;
    }
    //instance display methods
    public void display(){
          system.debug('===The Name Of the Course is' + coursename);
          system.debug('===The branch Of the Course is' + coursefees);
          system.debug('===The duration Of the Course is' + courseduration);
    }

}