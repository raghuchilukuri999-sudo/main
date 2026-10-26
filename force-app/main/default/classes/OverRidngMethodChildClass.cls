public class OverRidngMethodChildClass Extends OverRidingMethodParentClass {
    //here we need to use 'extends' and should enter parent class name of which you want to use in this child class
    //on the parent class you have to enter 'virtual' keyword in order to make it use for others
    
    //constructor
    public OverRidngMethodChildClass(){
        
    }
    //instance methods 
    //****
    //we have seen in parent class that we need to enter 'virtual' keyword infront of each and every method that we want to use in child class
    //also here in child class we need to enter 'overRide' keyword For Each and every method 
    //that we are getting and using them from the parent class
    // and remember one thing only if use them give 'overRide' keyword to them
    // if no use even if you get them parent class no need to give 'override keyword to them
    
    //here i'm bringing all the methods from the parent class and changing thier results as per my requirement
    //and using 'override' keyword for my wished/required/usable methods
    
 public override integer getAUTOloanROI(){
       integer result = 3;
        system.debug('== The Auto Loan ROI is===' + result);
        return result;
    }
     public override integer getHOMEloanROI(){
             integer result = 5;
        system.debug('== The Home Loan ROI is===' + result);
        return result;
    }
     public override integer getPersonalloanROI(){
             integer result = 2;
        system.debug('== The personal Loan ROI is===' + result);
        return result;
    }
        public override boolean haslockerfacility(){
              boolean result = false;
        system.debug('== The locker facility is avialable ===' + result);
        return result;
    }
    public override boolean hasOverDraftFacility(){
             boolean result = true;
        system.debug('== The over draft facility availble===' + result);
        return result;
    }
}