public virtual class OverRidingMethodParentClass {
    //here for parent class we need to use 'virtual' keyword inorder to other classes aquire data from it
    //cronstructor without parameters
    public OverRidingMethodParentClass(){
        system.debug('===OverRidingMethodParentClass constructor is called===');
    }
    //instance variables
    public string name;
    // Imp** In overriding method we not only 'virtual' keyword in starting but we also should use 'virtual'
    // keyword for each and every parent class methods that we are providing/ready to provide to other child classes
    // and in child class method we should a keyword 'override' for each method that we taken from the parent class
    
    // instance methods 
    public virtual integer getAUTOloanROI(){
       integer result = 0;
        system.debug('== The Auto Loan ROI is===' + result);
        return result;
    }
     public virtual integer getHOMEloanROI(){
             integer result = 0;
        system.debug('== The Home Loan ROI is===' + result);
        return result;
    }
     public virtual integer getPersonalloanROI(){
             integer result = 0;
        system.debug('== The personal Loan ROI is===' + result);
        return result;
    }
        public virtual boolean haslockerfacility(){
              boolean result = false;
        system.debug('== The locker facility is avialable ===' + result);
        return result;
    }
    public virtual boolean hasOverDraftFacility(){
             boolean result = false;
        system.debug('== The over draft facility availble===' + result);
        return result;
    }
}