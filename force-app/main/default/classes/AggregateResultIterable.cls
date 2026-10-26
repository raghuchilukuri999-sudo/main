public class AggregateResultIterable implements iterable<AggregateResult> {
    
    //instance variables
    public list<AggregateResult> AggregateResultlist;
    
    //constructor
    public AggregateResultIterable(list<AggregateResult> AggregateResults){
        //pass The constructor input parameter to the instance Variable
        AggregateResultlist = AggregateResults;
    }
    //calling the Interface of the AggregateResultiterator i.e iterator<AggregateResult>
    public iterator<AggregateResult> iterator(){
        
        //create the Instance of AggregateResultIterator class
        AggregateResultIterator agrIterator = new AggregateResultIterator(AggregateResultlist);
        
        //Return The Instance Of The Class
        return agrIterator;
    }

}