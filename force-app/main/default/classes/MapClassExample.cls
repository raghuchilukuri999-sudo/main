//This is a Mapclass Method Example which is combo key-value pair
//where key is like set which doesnot allows duplicates
//where value is like a list which allows duplicates
public class MapClassExample {
    //constructor
    public MapClassExample(){
        system.debug('====The  MapClassExample Constructor is called==== ');
    }
    //instance display Method
    public static void display(){
        //creating an instance with no elements
        map<integer,string> teachers = new map<integer,string>{};
            system.debug('===The keys in Teachers map are==='+ teachers.keySet());
            system.debug('===The Values in Teachers Map are===' + teachers.values());
            system.debug('===The No Of key-value pairs In the Teachers map are===' + teachers.size());
        //where map<integer data type is example for key,string datatype is example for map>
        //"keyset()" is a Mapclass Method From Apex Guide Which Return The "Keys" in the Map
        //"values()" is a  Mapclass Method From Apex Guide Which Return The "Values" in The Map
        //"size()" is a Mapclass Method From Apex Guide which Returns The Number Of Key-Value Pairs From The Map
        //since The Above One is an Empty Map With No Key-value Pairs It will return "0"
        
        //creating an instance With Elements
        map<integer,string> studentsmap = new map<integer,string>{1=>'Raghu',2=>'Vamshi',3=>'Naveen'};
            //remember Always key-value pair should be represented By "key=>value"
            system.debug('===The keys in studentsmap are==='+ studentsmap.keySet());
            system.debug('===The Values in studentsmap are===' + studentsmap.values());
            system.debug('===The No Of key-value pairs In the studentsmap are===' + studentsmap.size());
        
        //Add A New key-value Pair to The Map using "put(key, value)" Method From Apex Guide
        studentsmap.put(4, 'Phani');
            system.debug('===The keys in studentsmap after adding a new Key are==='+ studentsmap.keySet());
            system.debug('===The Values in studentsmap after adding a new value  are===' + studentsmap.values());
            system.debug('===The No Of key-value pairs In the studentsmap after adding a new key-value pair are===' + studentsmap.size());
        
        //Trying To Add A duplicate Key To the Map
        studentsmap.put(4, 'Raja');
            system.debug('===The keys in studentsmap after adding a duplicate Key are==='+ studentsmap.keySet());
            system.debug('===The Values in studentsmap after adding a new value  are===' + studentsmap.values());
            system.debug('===The No Of key-value pairs In the studentsmap after adding a new key-value pair are===' + studentsmap.size());
        //the value in the 4th position will gets replaced/overridden by the new value where as The Key will not becz keys dont allow duplicates
        
        //Trying To Add A Duplicate Value To The Map
        studentsmap.put(5, 'Raghu');
            system.debug('===The keys in studentsmap after adding a new Key are==='+ studentsmap.keySet());
            system.debug('===The Values in studentsmap after adding a duplicate value  are===' + studentsmap.values());
            system.debug('===The No Of key-value pairs In the studentsmap after adding a new key-value pair are===' + studentsmap.size());
        //Duplicate value will gets created with our new key becz values allows duplicates
        
        //checking If The Map Contains A Specified key using "containsKey(key)" Method From Apex Guide
        system.debug('===The Map Contains The 5th Key or Not??===' + studentsmap.containsKey(5));
        
        //Removing The 5th Key-value pair with mentioning the key only If the Above Statement proves true using "remove(key)" Method From Apex Guide
        if(studentsmap.containskey(5)){
            //firstly Get That Value At 5th using "get(key)" method From Apex Guide and Print
            //then remove the key-value pair using that specified i.e 5 using "remove(key)" method From APex Guide
            system.debug('===The Value in Key 5 is===' + studentsmap.get(5));
            studentsmap.remove(5);
            
            system.debug('===The keys in studentsmap after Removing a Key are==='+ studentsmap.keySet());
            system.debug('===The Values in studentsmap after Removing a value  are===' + studentsmap.values());
            system.debug('===The No Of key-value pairs In the studentsmap after Removing a key-value pair are===' + studentsmap.size()); 
        }
        
        //creating a New Map by creating Instance to Check The similarities Between The two Maps using "equals()" Method from APex Guide if yes it Returns "True"
        map<integer,string> femalestudentsmap = new map<integer,string>{6=>'vani',7=>'Roja',8=>'Pooja'};
            system.debug('===Students Map is same as femalestudentsmap..yes or no??===' + studentsmap.equals(femalestudentsmap ));
        
        //Copying all the key-value pairs From One map to another using "putAll(fromMap)" Method from Apex Guide
        studentsmap.putAll(femalestudentsmap);
            system.debug('===The keys in studentsmap After Adding femalestudentsmap key-value To studentsmap are==='+ studentsmap.keySet());
            system.debug('===The Values in studentsmap After Adding femalestudentsmap key-value To studentsmap are===' + studentsmap.values());
            system.debug('===The No Of key-value pairs In the studentsmap After Adding femalestudentsmap key-value To studentsmap are===' + studentsmap.size()); 
        
       //iterate Through the keys Of the Map And Display Each Key Separately
        for(integer i : studentsmap.keyset()){
            system.debug('===The Key in The Map Is===' + i);
        }
         //iterate Through the values Of the Map And Display Each value Separately
        for(string s : studentsmap.values()){
            system.debug('===The value in The Map Is===' + s);
        }
        
        //Representing The Map In string uing "tostring()" Method from Apex Guide
        system.debug('===The String Representation Of the Map is===' + studentsmap.tostring());
        
        //Getting The Hashcode Form Of The Map Using "hashcode()" From Apex Guide
        system.debug('====The Hashcode Of The Map is====' + studentsmap.hashcode());
        
        //creating a duplicate/cloning the map using "clone()" Method from Apex Guide
        map<integer,string> studentsmapclone = studentsmap.clone();
        system.debug('==The Keys In The Cloned Map are==='+ studentsmapclone.keyset());
        system.debug('===The Values In the Cloned Map Are===' + studentsmapclone.values());
        system.debug('===The Number Of Key-value pairs in The Map Are===' + studentsmapclone.size());
        
        //Remove All The Key-value Pairs From The Cloned Map at a time using "clear()" method From Apex Guide
        studentsmapclone.clear();
        system.debug('==The Keys In The Cloned Map after clearing everything are==='+ studentsmapclone.keyset());
        system.debug('===The Values In the Cloned Map after clearing everything Are===' + studentsmapclone.values());
        system.debug('===The Number Of Key-value pairs in The Map after clearing everything Are===' + studentsmapclone.size());
        
        //Now Checking Whether The Cloned Map is Empty or Not?? Using "isEmpty()" method From apex Guide
        //it returns "True" if yes
        system.debug('===The studentsmapclone is now Empty Or Not??==='+ studentsmapclone.isEmpty()); 
        
        
        //DeepCloning Method
        //Firstly create a Map With Key As Integer and Value as Sobject
        Map<Id,Customer__c> custMap = new Map<Id,Customer__c>();
        //creating a List For customers
        List<customer__c> customers = new List<customer__c>();
        //Adding A few Customers To The List (Our own Imagination)
        customer__c c1 = new customer__c();
        c1.name = 'raghu';
        customer__c c2 = new customer__c();
        c2.name = 'Varun';
        customer__c c3 = new customer__c();
        c2.name = 'Chakri';
        //Add The Elements To The Customers List using "Add(Element)" Method From Apex List guide
        customers.add(c1);
        customers.add(c2);
        //Insert The Customers using "insert" keyword
        insert customers;
        //Adding A List Of sObjects Records To The Map That we Created using "putAll(From Map) Method"
        custMap.putAll(customers);
        //checking the Records Are of which Type In the Map using "getsObjectType()" Method From Apex Map Guide
         system.debug('===The Records Are Of The object Type===' + custMap.getsObjectType());
         system.debug('===The Keys In the Map Before DeepCloning are===' + custMap.keyset());
         system.debug('===The Values In the Map before Deep Cloning Are===' + custMap.values());
         system.debug('===The Number of Key-value Pairs In The stdMap Are===' + custMap.size());
        
        //Now Creating A Deepcloning/Duplicte Copy Of The Map Using "deepclone()" Method From Apex Map Guide
        Map<Id,customer__c> deepclonecustMap = custMap.deepclone();
          system.debug('===The Keys In the Map After DeepCloning are===' + deepclonecustMap.keyset());
          system.debug('===The Values In the Map After Deep Cloning Are===' + deepclonecustMap.values());
          system.debug('===The Number of Key-value Pairs In The deepclonecustMap Are===' + deepclonecustMap.size());
        
    }

}