/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : ThiskeywordPracticone
 * Author          : <YourName>
 * Created Date    : Apr 8, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Apr 8, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Apr 8, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class ThiskeywordPracticone {

public String name;
public integer age;
public decimal percent;

public  ThiskeywordPracticone(string name,integer age,decimal interpercent){
this.name = name;
this.age = age;
    percent = interpercent;
}

public void display(){
	system.debug('The Name Is'+name);
	system.debug('the age is'+age);
    system.debug('The percent is'+percent);
}


}