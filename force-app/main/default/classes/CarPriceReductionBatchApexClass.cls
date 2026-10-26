public class CarPriceReductionBatchApexClass implements database.batchable<CarPriceReductionWrapper> {
    
    public iterable<CarPriceReductionWrapper> start(Database.Batchablecontext bc){
        Date todaysdate = date.Today();
        Date cutoffDate = todaysdate.adddays(-50);
        
        //create a list For CarPriceReductionWrapper 
        list<CarPriceReductionWrapper> CarWrapperList = New list<CarPriceReductionWrapper>();
        
        //Fetch The CarType Which are Created 50 days Before Today and Iterate Through Such Car Types
        for(car_Type__c cartype : [select id,Name,Car_Price__c,(select id From 	Customers__r)From Car_Type__c where CreatedDate < : cutoffDate]){
            //create a CarPriceReductionWrapper for Each CarType 
            CarPriceReductionWrapper car = new CarPriceReductionWrapper(cartype,cartype.Customers__r.size(),50.0);
            
            //Add each Wrapper To The List
             CarWrapperList.add(car);
        }
        
        //create an instance of the Class That Implements The Iterable Interface
        CarPriceReductionWrapperIterableclass iterableClassInstance = new CarPriceReductionWrapperIterableclass( CarWrapperList);
        return iterableClassInstance;
    }
   
    public void Execute(Database.Batchablecontext bc,list<CarPriceReductionWrapper> CarWrapperInBatches){
        //create a list To bulk Update The CarTypes
        list<Car_Type__c> carlist = new list<car_Type__c>();
        //Iterate Through Each batch of the CarPriceReductionWrapper
        for(CarPriceReductionWrapper cw : CarWrapperInBatches){
            //check if The Count of customers for each course is less Than 5
            if(cw.noOfcustomers  < 5){
                //Then Reduce The Price Of such CarTypes To 50%
                cw.cr.Car_Price__c = cw.cr.Car_Price__c*(cw.priceReductionPercentage/100);
            }
            //Add Each Cartype To The List
            carlist.add(cw.cr);
        }
        
        //check if there are any cartypes In The list
        if(!carlist.isEmpty()){
            update Carlist;
        }
    }
    
    public void Finish(database.Batchablecontext bc){
        //lets Keep This Optional
    }
    
}