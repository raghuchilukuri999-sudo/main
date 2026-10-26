public class CarPriceReductionWrapperIterator implements iterator<CarPriceReductionWrapper> {
    
    //instance variables
    public list<CarPriceReductionWrapper> carWrapper;
    public integer index;
    //constructor
    public CarPriceReductionWrapperIterator(list<CarPriceReductionWrapper> carWrapper){
        this.carwrapper = carwrapper;
        this.index = 0;
    }
    
    public boolean hasnext(){
        return index < carwrapper.size();
    }
    
    public CarPriceReductionWrapper next(){
        if(hasnext() == true){
            CarPriceReductionWrapper cfrw = carWrapper.get(index);
            index++;
            return cfrw;
            
        }
            else{
              throw new NosuchElementException('There are No such elements In The Iterator');
            }
        }
    }