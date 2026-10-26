public with sharing class practice1 {
    
    //custom data type
    public enum day{sunday,monday,tuesday,wednesday,thursday,friday,saturday}
    
    
    public  void praticemode(){
        
        //primitive data types
        
        boolean isworking = true;
        system.debug('===The Boolean Varibale==='+isworking);
        
        date dateofbirth = date.newinstance(2000,02,24);
        system.debug('===The date varaible ==='+dateofbirth);
        
        
        datetime timeanddate = datetime.newinstance(2000,02,24,9,25,58);
        system.debug('===The time and date ===='+timeanddate);
        
        
        integer ageofstudent = 24;
        system.debug('===the age of student is==='+ageofstudent);
        
        string stdname = 'sharma';
        system.debug('===the name odf student'+stdname);
        
        
        long indiapop = 612721112L;
        system.debug('===the indianpop'+indiapop);
        
        decimal nangupercent = 99.00;
        system.debug('the percentage of nagulu'+ nangupercent);
        
        double namguspegguluesinumber = 51.88121D;
        system.debug('the nanguspegguluesenumber'+namguspegguluesinumber);
        
        id stdid = 'a0HIR00001HUehZ2AT';
        system.debug('the std id is==='+stdid);
        
        time timenowdatatype = time.newinstance(2,6,09,39);
        system.debug('the timenow is '+timenowdatatype);
        
        blob binaryname = blob.valueof(stdname);
        system.debug('the binary value of the stdname is==='+binaryname);
        
        day todayday = day.tuesday;
        system.debug('today is==='+todayday);
        
        //collection data types
        list<string> stdlist = new list<string>{'Raghu','chandu','gajjela','sumita'};
            system.debug('===The stud list is ==='+stdlist);
        
        set<string> studids = new set<string>{'std-01','std-02','std-03'};
            system.debug('===the ids of the stud list==='+studids);
        
        map<string,string> stdmap = new map<string,string>{
            'std-01'=> 'raghu',
                'std-02'=>'chnadu',
                'std-03'=> 'nagulu'
                };
                    system.debug('stud map keys'+stdmap.keyset());
        system.debug('stud map values'+stdmap.values());
        
        
        //conditions
        decimal percentage = 60;
        integer experience = 10;
        if(percentage >=60){
            system.debug('eligible for job');
        }else{
            system.debug('not eligible for job');
        }
        
        if(experience < 2){
            system.debug('package:3lpa');
        }else if(experience < 5){
            system.debug('package:7lpa');
        }else{
            system.debug('package:19lpa');
        }
        
        
        integer a = 10,b=9,c=5;
        if(a>b){
            if(a>c){
                system.debug('A is greatest');
            }else{
                system.debug('c is the greatest');
            }
        }else{
            if(b>c){
                system.debug('b is the greatest');
            }else{
                system.debug('c is the greatest');
            }
        }
        
        //Loops
        
        //for
        for(integer i = 1;i<=5;i++){
            system.debug('for loop count'+i);
            //Start from 1, keep running till 5, increase by 1 each time.
        }
        
        //while
        integer count = 1;
        while(count <=3){
            system.debug('While count loop'+count);
            count++;
            //checks the condition firstly i mean only if its <=3 then count will increases
        }
        
        //dowhile
        integer num = 1;
        do{
            system.debug('do while count'+num);
        }while(num <=3);
        //Run once first, then check condition.”
        //Always runs at least once
        
        
        
        
    }
    
}