//Here We Are Taking CAR as a Parent OBject And Creating An Abstarct class For It
//To Make A Class abstract we need To Use The Keyword 'Abstract' At the Starting
public Abstract class AbstractclassParentClassCAR {
    //instance variables
    public string carcampanyname;
    //constructor
    public AbstractclassParentClassCAR(){
        system.debug('===Abstract Class Car Constructor Is Called');
    }
    //Instance methods made in abstraction Using 'Abstract' Keyword
    //******There will be No Body,{},ReturnTypes For This Abstract Methods
    public abstract string getcartype();
    public abstract integer getcarprice();
    public abstract integer getcarmanufacturingyear();
    public abstract string gettypeofgear();
    public abstract boolean hassunroof();
    //here if we not use 'abstract' keyword then it will be a non-abstract method
    
    
    //we can also give non-abstract methods in an abstract class but,then the class becomes partially-abstract class(not 100%)
    //The Non-abstract is a normal Instance method only it will have {},return types and body of the method
    //below is that example method..
    public boolean isfinanceoptionavailable(){
        return false;
    }
    
    //*****In Debugging stage or here we can't create an instance/new object For The Abstract class

}