public class Listpractice {
    
    public static void run(){
        
        //New List
        list<string> studlist = new list<string>{'Gajjela','Chandu','Ajay'};
            system.debug('the list of students are '+studlist);
        system.debug('The size of the list is '+studlist.size());
        
        //Adding New Element to list
        studlist.add('Veer');
        system.debug('the list of students are '+studlist);
        system.debug('The size of the list is '+studlist.size());
        
        //Duplicate Element to list
        studlist.add('Chandu');
        system.debug('the list of students are '+studlist);
        system.debug('The size of the list is '+studlist.size());
        
        //SectionB Students
        List<string> Studlist2 = new List<string>{'Rama','Krishna','Gopal'};
            studlist.addall(studlist2);//adding all of studlist2 to studlist
        system.debug('the list of students are '+studlist);
        system.debug('The size of the list is '+studlist.size());
        
        studlist.addall(new set<string>{'Raghav','Kanchan'});
        system.debug('the list of students are '+studlist);
        system.debug('The size of the list is '+studlist.size());
        
        //checking if an element is there in the List
        system.debug('Is Raghav In the List'+studlist.contains('Raghav'));
        
        if(Studlist.contains('Chandu')  == true){
            
        //The First Occurence of Anil is
        integer i = studlist.indexof('Chandu');
        system.debug('The Index Position of Chandu is'+i);
            
        //The Value in the First occurence of Chandu is
        system.debug('The Value in the First index Occurence of Chandu is==='+studlist.get(i));
            
        //removing an element from the list
        studlist.remove(i);
            
        system.debug('The Elements in the list after removing an element are==='+studlist);
        system.debug('The no of elements in the list after removing an elemnet are==='+studlist.size());
            
        }
        
        //overwrite an element
        studlist.set(1,'Babru');
        system.debug('The list elements after overriding'+studlist);
        system.debug('The Size of the List after overriding'+studlist.size());
        
        //Sorting the elements in the list
        studlist.sort();
        system.debug('The Sorted Elements in the List'+studlist);
        system.debug('The Sorted elements list size'+ studlist.size());
        
        //Iteration through a List
        for(string s : studlist){
            System.debug('The Name of the Student is'+s);
            
        }
        
        Iterator<String> studiterator = studlist.iterator();
        system.debug('The student iterator is'+studiterator);
        
        for(integer i =1;i<studlist.size();i++){
            if(studiterator.hasnext()==true){
                system.debug('The Next Element in the List is'+studiterator.next());
            }
            
                else{
                    throw new nosuchelementexception('There are no more Elements in the List');
                }
            }
        
        
            //Duplicating a list
    List<string> Dupstudlist = studlist.clone();
    System.debug('the elements in the dupestudelist are'+ dupstudlist);
    system.debug('The no of elemnets in the cloned List are'+ dupstudlist.size());
        
        
        System.debug('Is the Original and Duplist contains same Elements '+studlist.equals(dupstudlist));
        system.debug('The hashcode for the list is '+studlist.hashcode());
        System.debug('The representation of list in string version'+studlist.tostring());
        
        //Clearing everything from dupelist
        dupstudlist.clear();
        system.debug('The elements in the list after removing all'+dupstudlist);
        system.debug('The Size of the dupelist after all removal'+dupstudlist.size());
        
        //checking if the list is empty
        system.debug('is the dupelist empty now?'+dupstudlist.isempty());
        
        //deepclone will be only for sobject collections 
        //and parama of deepclone are
        /*deepClone(
    preserveId,
    isDeepClone,
    preserveReadonlyTimestamps
)
*/
List<Account> accList = [
    SELECT Id, Name
    FROM Account
    LIMIT 2
];

List<Account> deepCloneList = accList.deepClone(true, true, true);
        
        system.debug('The elements in the deepcloned list are'+deepclonelist);
        system.debug('the size of the deepcloned list is '+deepclonelist.size());
        }
    

    
    }