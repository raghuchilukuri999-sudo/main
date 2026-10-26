public class customiterator implements iterator<sobject> {
    
    //creating instance variables
    public list<sobject> sobjectlist;
    public integer index;
    
    //creating constructor
    public customiterator(list<sobject> sobjects){
        //pass The Parameters To The Constructors
        sobjectlist = sobjects;
        //initialize the index to 0
        index = 0;
    }
    
    //here in the Iterator Class We Have Two Methods That are 
    //hasnext and next
    //hasnext returns True If There is another Element in The Collection or In the List and Its Return Type is Boolean
    //next returns The Next Item in The List or The Collection and Its Return Type is any datatype Here we Took Sobject Data Type
    
    public boolean hasnext(){
        return index < sobjectlist.size();
        //here index starts With 0th And suppose we Take 10 Elements in the list
        //so 0<10 returns true so it returns the oth index
        //9<10 returns True So It returns The 10th index
        //10<10 false so the Loop Exits 
        
    }
    public sobject next(){
        if(hasnext() == true){
            return sobjectlist[index++];
            //returns the next index if there else no
        }
        else{
            throw new NosuchElementException('There are No Elements Remaine In The sobjectlist');
        }
    }

}