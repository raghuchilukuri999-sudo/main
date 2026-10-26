// This is an example of ListClass in which we have tried every list method in the Apex guide
public class ListClassExample {
    // Creating a default constructor with no elements
    public ListClassExample(){
        System.debug('=== ListClassExample constructor is called ===');
    }
    // Using a display method to print values in the constructor
    public static void Display(){
        // Firstly creating an instance/object for the list
        List<String> teachers = new List<String>();
        // Since this is an empty list there will be no values to pass
        System.debug('=== The elements in the list are === ' + teachers);
        System.debug('=== The number of elements in the list are === ' + teachers.size());
        // Here since the Display method is a static method
        // We have to use ClassName.methodName();
        // So we have used teachers.size();
        // size() method/function is defined by Apex
        
        // Note: When we debug this as this is an empty list
        // No values will be shown and the size of the list will be '0' because the number of elements is zero.
        
        // So we are creating a list with values/Elements we need to use "{}" for list with values/Elements
        List<String> students = new List<String>{'RaghuRam', 'Pavan', 'Akhil'};
        // Here in the list, we have defined the values
        System.debug('=== The elements in the list are === ' + students);
        System.debug('=== The number of elements in the list are === ' + students.size());
        
        //Adding A new Element To The List using "add(listElement)" function from the apex guide
        students.add('Mohan');
        System.debug('=== The Newly elements in the list are === ' + students);
        System.debug('=== The number of elements After The New Addition in the list are === ' + students.size());
        
        //Adding a Duplicate Element To the list using "add(listElement)" method/function From Apex Guide
        //since we know that 'list' allows duplicates
        students.add('RaghuRam');
        System.debug('=== The Newly added elements by dupliacting the list elements in the list are === ' + students);
        System.debug('=== The number of elements After The New Addition by duplicating in the list are === ' + students.size());
        
        //Inserting An element into the list at a 'specified position' in the list by using "add(index, listElement)" method from apex guide
        students.add(3, 'VaddeNaveen');
        System.debug('=== The Newly Inserted elements list elements in the list are === ' + students);
        System.debug('=== The number of elements After The New Addition by Inserting in the list are === ' + students.size());
        
        //creating a list another list Related to The students list by using constructor
        List<string> onlinestudents = new List<string>{'Kishore','vivah','Bindhu'};
        
        //Adding all the elements From one To Another Using "addAll(fromList)" Method From The apex Guide
        students.addAll(onlinestudents);
        system.debug('==The Elements In the List After Adding all elements From onlinestudents list to students list===' + students);
        system.debug('====The Number Of Elements In the List After  Adding all elements From onlinestudents list to students list===' + students.size());
        
        //creating a set of placed students which is interlinked to students list using constructor
        set<string> placedstudents = new set<string>{'Ankith','Avani','Bhoomi','RaghuRam'};
            
        //Adding All the Elements From The Created Set To A List (Here we are suing Students list) using "addAll(fromSet)" Method from Apex Guide
        students.addAll(placedstudents);
        system.debug('==The Elements In the List After Adding all elements From Placedstudents set to students list===' + students);
        system.debug('====The Number Of Elements In the List After  Adding all elements From Placedstudents set to students list===' + students.size());
        //RaghuRam will not 3rd Time Becz,List Will Allows DUpliactes But Not Set
        //Eventhough We Are Converting set To list First Only The "RaghuRam " For the 3rd Time Will be Removed
        
        //Check Whether The List Contains A Particular Element/Value That you mentioned using "contains(listElement)" Method From Apex Guide
        //If contains True
        //if Not Then False
       System.debug('===Check Whether The List Contains Element Named Anil Or Not===' + students.contains('Anil'));
if (students.contains('RaghuRam')) {
    System.debug('===The List Contains RaghuRam ===');
} else {
    System.debug('===The List Does Not Contain RaghuRam===');
}
        // Bring the index position of 'RaghuRam' (if present, it will return the first occurrence)
Integer stud = students.indexOf('RaghuRam');
System.debug('===The Position Of RaghuRam in The List is===' + stud);
        //it will bring '0' becz, 'RaghuRam' is At 0th index (starting index)
        
        //Bring The Element At a Specified Occurance using  "get(index)" method From Apex Guide
        students.get(6);
        system.debug('===The Element in The 6th occurance/index is==' + students.get(6));
        //you can also do it this way
        students.get(stud);
        system.debug('===The Position of the element that is in variable is======' + students.get(stud)); 
        //it will bring '0' becz, 'RaghuRam' is At 0th index (starting index)
        
        //Removing An Element From The List by using "remove(index)" method from apex guide
        students.remove(4);
        system.debug('==The Removed Element From The List is===' + students.remove(4));
        
        //Setting or OverRiding or Replacing An Element With Another Element In The List using "set(index, listElement)" method from APex Guide
        students.set(4,'Daggubativenkatesh');
        System.debug('=== The elements in the list are === ' + students);
        System.debug('=== The number of elements in the list are === ' + students.size());
        
        //sorting The Elements In The List Using "sort()" Method From Apex Guide
        students.sort();
        System.debug('=== The elements in the list After Sorting The List are === ' + students);
        System.debug('=== The number of elements in the list After Sorting are === ' + students.size());
        
        //Iterate Through All The Elemnets In The List And 
        //Display Each Element In The List using "for(datatype varaiablename : objectname/instancename){}" From Apex Guide
        for(string studnames : students){
            system.debug('===The Name Of The student is===' + studnames);
        }
        
// Initialize the iterator for the list of students
Iterator<String> studiterator = students.iterator();

// Print the iterator (Note: This will not print the elements, just the object reference)
System.debug('===The Student Iterator is===' + studiterator);

// Iterate through the list using the iterator
// hasNext() method from Apex Guide Checks If there Is any Next Element In The list
while (studiterator.hasNext()) {
    //After Checking Using HasNext(),To Get/Return the next element in the list we use "next()" method from apex guide
    String nextStudent = studiterator.next();
    System.debug('===The Next Element in The list is===' + nextStudent);
}
        //Create a Duplicate Copy of a list uing "clear()" Method From Apex Guide
        List<string> duplicatestudents = students.clone();
        system.debug('===The Elements In the Cloned List Are===' + students);
        system.debug('===The No Of Elements In the Cloned List Are====' + students.size());
        
        //check if Two list Have The same Values/Elements By using "equals(list2)" From Apex Guide
        system.debug('===The Original Students list and Duplicate students list is same or not===' + students.equals(duplicatestudents));
        
        //Returning The Hashcodes corresponding To The list and Its Contents Using "hashCode()" method from apex guide
        system.debug('====The Hashcodes Corresponding To The list And Its Contents==' + students.hashcode());
        
        //Returning/Getting The string Representation Of The List using "toString()" method from Apex Guide
        system.debug('====The String Representation Of the List is=='+ students.tostring());
        
        //Removing All the Elements In the List by using "clear()" Method From Apex Guide
        duplicatestudents.clear();
        System.debug('=== The elements in the duplicate students list after claering all are === ' + duplicatestudents);
        System.debug('=== The number of elements in the duplicate list after clearing all are === ' + duplicatestudents.size());
        
        //Checking Whether a List Is Empty Or Not Using "isEmpty()" method From An APex Guide
        system.debug('==Orginial students list has no elements=== ' + students.isEmpty());
        system.debug('==Cloned students list has no elements=== ' + duplicatestudents.isEmpty());
        
        //Using "deepClone(preserveId, preserveReadonlyTimestamps, preserveAutonumber)" Method From Apex Guide 
        //Making A Dulicate Copy Of A list of sObject records, including the sObject records themselves.
        
        //firstly Creating An Instnace/Object For The Sobjects For Customer1
        customer__c cust1 = new customer__c();
        cust1.Name = 'BrughuRam';
        cust1.Last_Name_Of_Customer__c = 'Iiravatham';
        cust1.First_name__c = 'Mumbai';
        
        //Creating An Instnace/Object For The Sobjects for Customer 2
        customer__c cust2 = new customer__c();
        cust2.Name = 'Anand';
        cust2.Last_Name_Of_Customer__c = 'Vihari';
        cust2.First_name__c = 'Chennai';
        
        //Create A list With customer__c as  Data Type And Pass The customers To The list since this is a object/variable return type method
        list<customer__c> CustomerList1 = new list<customer__c>{cust1,cust2};
            //here cust1 and cust2 are not string data type so need of using '' for that its customer data type so dircetly write it
            system.debug('===The list of Students are ====' + CustomerList1);
        //creating a duplicate copy of Sobjects using "deepClone(preserveId, preserveReadonlyTimestamps, preserveAutonumber)" Method
        list<customer__c> CustomerList2 = CustomerList1.deepclone();
        system.debug('===The list of Customers After DeepClone are==='+ CustomerList2);
        
        //Inserting The students using "insert" method 
        insert CustomerList1;
        //After Inserting a Record we Will Get A unique Id For each Record We inserted
        //query the inserted customer records and store them in a list
        list<customer__c> CustomersList = [select id,Name,Last_Name_Of_Customer__c,First_name__c,Customer_ID__c,CreatedById,LastModifiedById from customer__c where Name = 'BrughuRam' or Name = 'Vihari'];
        system.debug('===The List of Customers Before deep cloning Are==='+ CustomersList);
        //Iterate through The list
        for(customer__c s : CustomersList){
            system.debug('===The Customer id Before Deep Clone Is===' + s.id);
            system.debug('===The customer id Before Deep Clone Is===' + s.Customer_ID__c);
            system.debug('===The customer id Before Deep Clone Is===' + s.CreatedById);
            system.debug('===The customer id Before Deep Clone Is===' + s.LastModifiedById);
        }
        
        //cloning the CustomersList and Creating List3
        List<customer__c> CustomerList3 = CustomersList.deepclone(true,true,true);
        //here in deepclone('preserveIds' means 'ID','PreseveDates' Means Createddate,LastModifiedDate,Createdby,ModifiedBy etc.
        //'preserveAutoNumber Means AutoNumber fields Here Our Auto Number Field Is 'CustomerIds')
        system.debug('==The List Of Customers After Deep Cloning Are=='+ CustomerList3);
        //Iterate through The list
        for(customer__c cust : CustomersList){
            system.debug('===The Customer id After Deep Clone Is===' + cust.id);
            system.debug('===The customer id After Deep Clone Is===' + cust.Customer_ID__c);
            system.debug('===The customer id After Deep Clone Is===' + cust.CreatedById);
            system.debug('===The customer id After Deep Clone Is===' + cust.LastModifiedById);
        }
        
        //Using "getSObjectType()" which Returns the token of the sObject type that makes up a list of sObjects.
        //This Is A "Class" return type Method
        //Query the customer object And store the Result in a Generic Sobject Variable
        list<Sobject> Sobj = [select id,Name From customer__c Limit1];
        //check if the Sobject Data Type That makes up a list Of Sobjects
        system.debug('===The Sobject Type Is==='+Sobj.getSObjectType());
        //IF we see the "Sobj.getSObjectType()" will Return "Schema.SobjectType()" Where Schema is a predefined Class 
        //And SobjectType() is Sobject type
        schema.SObjectType obj = Sobj.getSobjectType();
        //it will check what type of Sobject Data the List Contains And will be returned By The "Sobject()"
        //here Ex: Customer__c Sobject Data Type
        System.assertequals(customer__c.SobjectType,Sobj.getSobjectType());
        
    }
}