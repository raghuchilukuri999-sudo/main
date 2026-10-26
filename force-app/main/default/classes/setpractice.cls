/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : setpractice
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

public class setpractice {


public static void run(){

	set<string> studids = new set<string>{'STD-01','STD-02'};
	System.debug('The Id in the set are'+studids);
	system.debug('The Size of the set are'+studids.size());

	//Add a new element to the set
	studids.add('STD-03');
	system.debug('The ids in the set are'+studids);
	system.debug('The size of the set are'+studids.size());

	//Trying to insert a Dupe id into set
	studids.add('STD-01');
	system.debug('The ids in the set are'+studids);
	system.debug('The size of the set are'+studids.size());


	//create a list to add them to set
	studids.addall(new list<string>{'STD-03','STD-04','STD-05'});
	system.debug('The ids in the set are'+studids);
	system.debug('The size of the set are'+studids.size());

	//Now add a Set to the set
	studids.addall(new set<string>{'STD-006','STD-007'});
	system.debug('The ids in the set are'+studids);
	system.debug('The size of the set are'+studids.size());

	//checking for an elemnet in the set
	system.debug('is the STD-001 in the List'+studids.contains('STD-001'));

	set<string> studset2 = new set<string>{'STD-08','STD-09'};
	studids.addall(studset2);
	system.debug('Is the set2 elements contains in set1 '+studids.containsall(studset2));

	//Iterating over the set
	for(string s : studids){
		system.debug('The each id is'+s);
	}

	//remove an element
	studids.remove('STD-009');
	system.debug('The ids in the set are'+studids);
	system.debug('The size of the set are'+studids.size());

	//removing all elemnets inside of the set
	studids.removeAll(studset2);
	system.debug('The elements in the set are '+studids);
	system.debug('the size of the  after removing set all elemnets is'+studids.size());

	//retaining all the elements inside the set
	studids.retainAll(studset2);
	system.debug('The elements in the set are'+studids);
	system.debug('The size of the set after retaining is'+studids.size());

	//converting a Set to a String
	system.debug('The set in the string way is '+studids.tostring());

	//cloning the set
	set<string> dupestudids = studids.clone();
	system.debug('The elements in the set are'+dupestudids);
	system.debug('The size of the set after retaining is'+dupestudids.size());

	//removing all the elementw from the Dupeset
	dupestudids.clear();
		system.debug('The elements in the set are'+dupestudids);
	system.debug('The size of the set after retaining is'+dupestudids.size());

	//Checking whether a Set is empty or not
	system.debug('is the set Emptied'+dupestudids.isempty());



}

}