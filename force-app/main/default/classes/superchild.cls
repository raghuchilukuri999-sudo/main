public class superchild extends superparent{
    
    
    //calling parent constructors at a time
    public superchild(){
    super('Bhargava','ram','python');
        
    }
    
    //calling parent methods
    public override string getstddetails(){
        string fullname = super.getstddetails();
        system.debug('printing full name'+fullname);
        return fullname;
    }
    public override string getstdcourse(){
        string course = super.getstdcourse();
        system.debug('printing course'+course);
        return course;
    }

}