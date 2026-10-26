public class CarPriceReductionWrapper {
    
    //instance variable
    public car_Type__c cr;
    public integer noOfcustomers;
    public decimal priceReductionPercentage;
    
    //create a constructor
    public CarPriceReductionWrapper(car_Type__c cr,integer noOfcustomers,decimal priceReductionPercentage){
        //since The instance varibales and The Local Parameters Are same use This keyword
        this.cr = cr;
        this.noOfcustomers = noOfcustomers;
        this.priceReductionPercentage = priceReductionPercentage;
    }
    
    

}