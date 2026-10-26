//Here We are Going To use various Instance Methods Of "Set Class" From Apex Guide
public class SetClassExample {
    //Constructor with No Elements
    public SetClassExample(){
        system.debug('===The SetclassExample consructor is===');
    }
    
    //Display Method To Display The SetClass Instance Methods From Apex Guide
    public static void display(){
        //create an instance of the SetClassExample
        set<string> teachersids = new set<string>();
        system.debug('==The Elements in the set are===' + teachersids);
        system.debug('====The Number Of elements in The Set Are===' + teachersids.size());
        //we know that Size() Method Is used To Bring the Number of elements in The set
        //As This Is a Instnace method We use objectname.method name
        //i.e teachersids.size()
        //since this is an empty set this will show zero only
        
        //Lets create an instance and give values into them and w.k.t if we wnat to give values we use "{}"
        set<string> studentids = new set<string>{'std-001','std-002','std-003','std-004','std-005'};
        system.debug('==The Elements in the set are===' + studentids);
        system.debug('====The Number Of elements in The Set Are===' + studentids.size()); 
        
        //Lets add an Element To The set using "add(setElement)" instance Methodfunction From The Apex Guide
        studentids.add('std-006');
        system.debug('==The Elements in the set after adding an extra Element are===' + studentids);
        system.debug('====The Number Of elements in The Set after adding an extra Element Are===' + studentids.size()); 
        
        //Lets Duplicate Element To the set or Try To Add A Dupliacte Element to the set
        studentids.add('std-004');
        system.debug('==The Elements in the set after adding an extra Element are===' + studentids);
        system.debug('====The Number Of elements in The Set after adding an extra Element Are===' + studentids.size()); 
        //its not at all possible becz set allows no duplicates
        
        //Lets create A list Of student ids And Try To 
        //Add This list Of student ids To Our  studentids set using "addAll(fromList)" Method From Apex Guide
        list<string> FailedStudentsidslist = new list<string>{'std-003','std-007','std-008'};
            //since list allows a duplicate values we created a duplicate element also.
            //Tring to add our list to the set
            studentids.addAll(FailedStudentsidslist);
        system.debug('==The Elements in the set after adding a list of Elements to our set are===' + studentids);
        system.debug('====The Number Of elements in The Set after adding a list of Elements to our set are===' + studentids.size()); 
       //we know that our lsi allows duplicates but not our set so "std-003" will not be printed twice
       
        //Lets create a set and try to add that set of elements to our studentids set using "addAll(fromSet)" method from apex guide
        set<string> passedstudentidsset = new set<string>{'std-009','std-010','std-011'};
            studentids.addAll(passedstudentidsset);
        system.debug('==The Elements in the set after adding a set of Elements to our set are===' + studentids);
        system.debug('====The Number Of elements in The Set after adding a set of Elements to our set are===' + studentids.size()); 
        
        //check whether our set contains specified elements or not using "contains(setElement)" Method From Apex Guide
        studentids.contains('std-001');
        system.debug('==Checking our Set Contains "std-001" or not====' + studentids.contains('std-001'));
        
        //check if our studentids set conatins all the specified elements From a list or not if all are present it will give "True" 
        //using "containsAll(listToCompare)" Method From Apex Guide
        studentids.containsAll(FailedStudentsidslist);
        system.debug('===checking if our studentids set conatins all the specified elements From a list or not===' + studentids.containsAll(FailedStudentsidslist));
        
        //Checking If our studentids set contains all the specified elements From An Another Set or not if contains then it returns "True"
        //using "containsAll(setToCompare)" Method From Apex Guide
        studentids.containsAll(passedstudentidsset);
        system.debug('===checking if our studentids set conatins all the specified elements From another set or not===' + studentids.containsAll(passedstudentidsset));
        
        //checking if Two sets Having Same Elements using "equals(set2)" Method From Apex Guide if True It will return "True"
        studentids.equals(passedstudentidsset);
         system.debug('===checking if Two sets Having Same Elements or not===' + studentids.equals(passedstudentidsset));
        
        //checking The Hashcode Our set using "hashCode()" Method From APex Guide
        system.debug('===checking The Hashcode Our set using "hashCode()"====' + studentids.hashcode());
        
        //Iterate over the set using General "for(){}" Method
        for(string s : studentids){
            system.debug('===The Id of The student Is===' + s);
        }
        
        //Removing An Element/specified Element From Our Set Using "remove(setElement)" Method From The Apex Guide
        passedstudentidsset.remove('std-009');
        system.debug('===Printing The Elements Remained In The passedstudentidsset after Removing "std-009"===' + passedstudentidsset);
        system.debug('===Number Of Elements Remained In passedstudentidsset After Removing "std-009"===' + passedstudentidsset.size());
        
        //Retaining/Allowing List Of elements From our set(The Elements Which Matches the list Will bE remained,Remaining Will be Removed from the original Set)
        //by using "retainAll(listOfElementsToRetain)" Method from Apex Guide
        studentids.retainAll(FailedStudentsidslist);
        system.debug('===The Remaining/Retained Elements in The set after retaining list Are===' + studentids);
        system.debug('===Number Of Remaining Elements In the set After Retaining list elements Are=='+ studentids.size());
        
        //Retaining/Allowing set Of elements From our set(The Elements Which Matches the another set Will bE remained,Remaining Will be Removed from the original Set)
        //by using retain "retainAll(setOfElementsToRetain)" Method From Apex Guide
        studentids.retainAll(passedstudentidsset);
        system.debug('===The Remaining/Retained Elements in The set after Retaining set elements Are===' + studentids);
        system.debug('===Number Of Retained Elements In the set After Retaining set elements Are=='+ studentids.size());
        
        //Removing List Of Elements From The Set(The Elements That Are In The List Will Be removed From The set Also)
        //by using "removeAll(listOfElementsToRemove)" Method From Apex Guide
        studentids.removeAll(FailedStudentsidslist);
        system.debug('===The Remaining Elements in The set after removing list Are===' + studentids);
        system.debug('===Number Of Remaining Elements In the set After Removing list elements Are=='+ studentids.size());
        
        //Removing set Of Elements From The Set(The Elements That Are In The set Will Be removed From The set Also)
        //by using "removeAll(setOfElementsToRemove)" from Apex Guide
        studentids.removeall(passedstudentidsset);
        system.debug('===The Remaining Elements in The set after Removing set elements Are===' + studentids);
        system.debug('===Number Of Remaining Elements In the set After Removing set elements Are=='+ studentids.size());
        
        //converting set to string using "toString()" Method From Apex Guide
        system.debug('==The studentids set After Converting To String is==' + studentids.tostring());
        
        //cloning the original set to create a Duplicate set using "clone()" Method from the Apex Guide
        set<string> studentidsduplicateset = studentids.clone();
        system.debug('==The Elements in the studentidsduplicateset are===' + studentidsduplicateset);
        system.debug('====The Number Of elements in The studentidsduplicateset Are===' + studentidsduplicateset.size()); 
        
        //Clearing/removing All The Elements From The studentidsduplicateset At once using "clear()" Method From Apex Guide
        studentidsduplicateset.clear();
        system.debug('==The Elements in the studentidsduplicateset after Clearing All The Elements are===' + studentidsduplicateset);
        system.debug('====The Number Of elements in The studentidsduplicateset After Claering All The Elements Are===' + studentidsduplicateset.size());
        
        //checking if our set is empty or not if true it returns "True" using "isEmpty()" Method From Apex Guide
        studentidsduplicateset.isEmpty();
        system.debug('==The Elements in the studentidsduplicateset are===' +  studentidsduplicateset.isEmpty());
    }

}