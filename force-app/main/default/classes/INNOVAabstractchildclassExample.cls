public class INNOVAabstractchildclassExample extends AbstractclassParentClassCAR{
    //just like the parent-child classes here also we uses extends keyword along with parentAbstractclass Name
    //*****we have To Define The Return Type,ANd Values,Body of The Method,{} For The Parent Abstract Methods In this Child Abstract class Methods
    //so as To use Them
    
    //calling instance methods From ParentAbstractclass and 'override; keyword is must and should 
    
    public override string getcartype(){
        string cartype = 'Electrical';
        system.debug('=The Car type Is==' + cartype);
        return cartype;
    }
     public override integer getcarprice(){
        return 50000000;
    }
     public override integer getcarmanufacturingyear(){
        return 2024;
    }
     public override string gettypeofgear(){
         string typeofgear = 'Automated';
         system.debug('===The Type of Gear Of car Is==' + typeofgear);
         return typeofgear;
    }
     public override boolean hassunroof(){
        return true;
    }
    // Debugging/displaying method to call all the other methods and log their results
    public void debug() {
        System.debug('=== Debugging INNOVAabstractchildclassExample ===');
        System.debug('Car Type: ' + getCarType());
        System.debug('Car Price: ' + getCarPrice());
        System.debug('Car Manufacturing Year: ' + getCarManufacturingYear());
        System.debug('Type of Gear: ' + getTypeOfGear());
        System.debug('Has Sunroof: ' + hasSunroof());
        System.debug('Finance Option Available: ' + isFinanceOptionAvailable());
        
    }
}

//******Your Can Write The Debugging Part Of Creating An instance/Object For The Child Abstract class It Will Bring The Parent Abstract Class Also