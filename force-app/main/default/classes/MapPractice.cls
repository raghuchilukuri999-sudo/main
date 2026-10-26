/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : MapPractice
 * Author          : <YourName>
 * Created Date    : May 17, 2026
 * Last Modified By: <YourName>
 * Last Modified On: May 17, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  May 17, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class MapPractice {

public static void run(){

	Map<Integer,string> Map1 = new map<integer,string>{1=>'Raghu',2=>'Tej',3=>'Chandu',4=>'Sumitha'};
	system.debug('The keys in the Map are '+Map1.keyset());
	system.debug('The Values in the map are '+map1.Values());
	system.debug('The size of the map is'+map1.size());

	//New element addition 
	Map1.putall(new Map<integer,string>{4=>'Kinder'});
	system.debug('after addition Map keys'+map1.keyset());
	system.debug('the values in Map are'+map1.values());
	system.debug('the size of the map is'+map1.size());

	//testing Duplicate Key addition and a value Addtion to the map
	map1.putall(new map<integer,string>{5=>'Kinder',4=>'Basha'});
	system.debug('after addition Map keys'+map1.keyset());
	system.debug('the values in Map are'+map1.values());
	system.debug('the size of the map is'+map1.size());

    //checking for a Specified Key
	system.debug('Is the Key 1 Present in the map?'+map1.containskey(1));

	if(map1.containskey(1) == true){
		system.debug('The Value for the key 1 is '+map1.get(1));

		map1.remove(1);

		system.debug('after removal Map keys'+map1.keyset());
	    system.debug('the values in Map are'+map1.values());
	    system.debug('the size of the map is'+map1.size());
	
	}

	map<integer,string> map2 = new map<integer,string>{6=>'Raghva',7=>'Suresh'};
	system.debug('Is the map2 and map1 elements the same?'+map1.equals(map2));

     //copying things from map2 to map1
	 map1.putall(map2);
	system.debug('The keys in the Map are '+Map1.keyset());
	system.debug('The Values in the map are '+map1.Values());
	system.debug('The size of the map is'+map1.size());

	//displaying each key
	for(integer i : map1.keyset()){
		system.debug('The each key is'+i);
	}

	//displaying each value in the map
	for(string s : map1.values()){
		system.debug('The Each value in the map is '+s);
	}

	//The String repressentation of the mapis
	system.debug('The Map in the string format is '+map1.tostring());

	system.debug('the hashcode of the map is '+map1.hashcode());

	//cloning the map
	map<integer,string> map3 = map1.clone();
	system.debug('The keys in the Map are '+Map3.keyset());
	system.debug('The Values in the map are '+map3.Values());
	system.debug('The size of the map is'+map3.size());


	//removing all elements from a Map
	map3.clear();
	system.debug('The keys in the Map are '+Map3.keyset());
	system.debug('The Values in the map are '+map3.Values());
	system.debug('The size of the map is'+map3.size());

	system.debug('is the Map Now Empty ?'+map3.isempty());

}

	//A New Method to Display sobject 
	public static void display(){
		//creating a map with Integer and an Sobject
		Map<Id,Patient__c> Sobjectmap = new Map<Id,Patient__c>();

		//a list for Patients
		list<Patient__c> patlist = new list<Patient__c>();

		Patient__c p = new Patient__c();
		p.Patient_name__c = 'Bhargava';

		Patient__c p2 = new Patient__c();
		p2.Patient_name__c = 'Bhargavi';

		patlist.add(p);
		patlist.add(p2);

		insert patlist;

		list<Patient__c> patlist2 = new list<Patient__c>{new Patient__c(Patient_name__c = 'jitesh'),new Patient__c(Patient_name__c = 'brijesh')};

		insert patlist2;

		//Adding the Lists to the map
		Sobjectmap.putAll(patlist);
		Sobjectmap.putAll(patlist2);

		system.debug('the sobject in the map is '+sobjectmap.getsobjecttype());
		system.debug('The Keys in the map are '+Sobjectmap.keyset());
		system.debug('the values in the map are '+Sobjectmap.values());
		system.debug('The size of the map is '+Sobjectmap.size());

		//deepcloning the map
		map<id,Patient__c> Sobjectmap2 = Sobjectmap.deepclone();
		system.debug('The Keys in the map are '+Sobjectmap2.keyset());
		system.debug('the values in the map are '+Sobjectmap2.values());
		system.debug('The size of the map is '+Sobjectmap2.size());




	}

}