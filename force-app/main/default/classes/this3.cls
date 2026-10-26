public class this3 {
    
    //declaring variables
    public string name;
    public integer age;
    public integer marksscored;
    public integer totalmarks;
    
    //default constructor
    public this3(){
        integer totalmarks =1000;
        system.debug('The value is mentioned in default constructor');
        }
    
    //para-cosntructor
    public this3(string name,integer age,integer marksscored){
        this();//calling the default constructor here 
        this.name = name;
        this.age = age;
        this.marksscored = marksscored;
    }
    
    //print
    public void display(){
         system.debug(''+this.name);
         system.debug(''+this.age);
         system.debug(''+this.marksscored);
         system.debug(''+totalmarks);
        
        
    }
    

}