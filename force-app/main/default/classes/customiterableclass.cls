public class customiterableclass implements iterable<sobject>{
    
    //instance variables
    public list<sobject> sobjectlist;
    
    //constructor
    public customiterableclass(list<sobject> sobjects){
        sobjectlist = sobjects;
    }
    
    public iterator<sobject> iterator(){
        //create an instance of the iterator class
        customiterator custiterator = new customiterator(sobjectlist);
        //return th instance of the class
        return custiterator;
    }
    

}