public class PartialUpdatePractice {
    
    public static void partialupdate(){
        
        List<Account> acclist = [select id from Account where name like '%Select Item 1	Shyam Singh1%'];
        
        List<Account> accupdatelist = new List<Account>();
        
        for(Account acc : acclist){
            if(acc.phone != null){
                
                acc.phone = '+91989367890';
                accupdatelist.add(acc);
            }
        }
        
        if(accupdatelist.size()>0){
            List<database.saveresult> srlist = database.update(accupdatelist,false);
            for(database.saveresult sr : srlist){
                if(sr.issuccess() == true){
                    system.debug('The Updated Account ids are'+sr.getid());
                }else{
                    list<Database.error> errlist = sr.geterrors();
                    for(Database.error err : errlist){
                        system.debug('==The Field that is causing the Error===' + err.getFields());
                        
                        system.debug('==The Error Message is===' + err.getMessage());
                        
                        system.debug('==The Status Code of the Error is===' + err.getStatusCode()); 
                    }
                }
            }
        }
    }
}