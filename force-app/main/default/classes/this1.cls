public class this1 {
    
    //instance variables
    public string name;
    public integer age;
    public integer marks;
    
    //para-construct
    public this1(string name,integer age,integer marks){
        this.name = name;
        this.age = age;
        this.marks = marks;
    }
    
    //method
    public void display(){
        system.debug(''+name);
        system.debug(''+age);
        system.debug(''+marks);
    }

}