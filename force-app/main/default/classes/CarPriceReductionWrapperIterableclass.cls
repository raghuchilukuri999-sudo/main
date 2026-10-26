public class CarPriceReductionWrapperIterableclass implements iterable<CarPriceReductionWrapper> {
    
    //instane variables
    public list<CarPriceReductionWrapper> carwrapper;
    //contructor
    public  CarPriceReductionWrapperIterableclass(list<CarPriceReductionWrapper> carwrapper){
        this.carwrapper = carwrapper;
    }
    //calling Inteference of The CarPriceReductionWrapperIterator class here
    public iterator<CarPriceReductionWrapper> iterator(){
        //create an instance of the CarPriceReductionWrapperIterator class
        CarPriceReductionWrapperIterator cariteratorInstance = new CarPriceReductionWrapperIterator(carwrapper);
        return cariteratorInstance;
    }

}