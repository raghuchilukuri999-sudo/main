public class PartialInsertPractice {
    
    public static void PartialInsert(){
        
        //Generally With Dml we can't truly perform Dml's 
        //Completely like it will fail All the records or Pass
        //all of them so to make Sure passing Things Should perform Dml and failed one's
        //be Avoided We use partial Dmls
        
        List<Account> acclist = new list<Account>();
        
        for(integer i=1;i<=10;i++){
            Account acc = new Account();
            acc.Name = 'Shyam Singh'+i;
            acc.Email__c = 'panileniemail@gmail.com';
            acc.Phone = '+916723237890';
            acclist.add(acc);
        }
        
        if(acclist.size()>0){
            
            
            //Partial Insert Dml
            database.saveresult[] results = database.insert(acclist,false);
            
            for(database.saveresult sr : results){
                if(sr.issuccess() == true){
                    system.debug('The records that got passed are'+ sr.getid());
                    
                }else{
                    for(database.error err : sr.geterrors()){
                        system.debug('===The following records have failed====');
                        system.debug('===The status code why records have failed to process====' + err.getStatusCode());
                        system.debug('===The reason why records have failed to process===='+ err.getMessage());
                        system.debug('===The fields that which caused the error====' + err.getFields());
                    }
                }
            }
        }
        
        
        
    }
}