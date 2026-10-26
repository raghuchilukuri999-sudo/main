public class AggregateResultIterator implements iterator<AggregateResult> {
    
    //instance variables
    public list<AggregateResult> AggregateResultlist;
    public integer index;
    
    //constructor
    public AggregateResultIterator(list<AggregateResult> AggregateResults){
        //pass The comstructor input parameter to the instance variable
        AggregateResultlist = AggregateResults;
        //initialize The Index to 0
        index = 0;
    }
    
    public boolean hasnext(){
        return index < Aggregateresultlist.size();
    }
    public AggregateResult next(){
        //check if there is a next element in the list
        if(hasnext() == true){
            return AggregateResultlist[index++];
        }
        else{
            throw new NosuchElementException('No There are No Further Elements In The list');
        }
    }

}