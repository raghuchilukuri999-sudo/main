public class MultiObjectIterableBatchApex implements database.batchable<sobject> {
    
    //instance Varibales To the Store The sobjects
    public list<sobject> sobjectslist;
    
    //constructor
    public MultiObjectIterableBatchApex(){
        //initialize the sobjectlist
        sobjectslist = new list<sobject>();
    }
    
    public system.iterable<sobject> start(database.batchablecontext bc){
        //fetch The Opportunities which are open and whose closedate has been Already passed
        // and iterate through such opportunities and add each of them to the sobject list
        for(opportunity opp:[select id,Name,stagename,closedate,isclosed From Opportunity where closedate < Today And isclosed = False]){
            //Add each Opportunity To the sobject list
            sobjectslist.add(opp);
        }
        //similarly fetch The cases whose status is escalated and whose escalated checkbox is false and SLAVioaltion is Not 'Yes' 
        //And Iterate Through Such cases and add each case To The sobjectlist
        for(case cs :[select id,caseNumber,status,IsEscalated,SLAViolation__c From Case Where Status = 'Escalated' And (IsEscalated = False)]){
            //Add each Opportunity To the sobject list
            sobjectslist.add(cs);
         }
        
    //create an instance Of the CustomIterable class
    customiterableclass Customiterableinstance = new customiterableclass(sobjectslist);
        
     //return The instance Of the custom iterable class 
     return Customiterableinstance;
 
    }
    
    public void Execute(database.Batchablecontext bc,list<sobject> sobjectsprocessedinBatches){
        
        //create a list To Bulk Update The Opportunities
        list<opportunity> opplist = new list<opportunity>();
        
        //create  alist To bulk update The Cases
        list<case> caselist = new list<case>();
        
        //To Get The Sobject From Generic Sobject We use A predefined Apex Class
        //schema and its method getSobjectype()
        schema.sobjectType oppSobject = schema.opportunity.getsobjectType();
        schema.sobjectType CaseSobject = schema.case.getsobjectType();
        
        //iterate Through The each batch of Sobject Records That are Passed From The Start Method
        for(sobject sobj:sobjectsprocessedinBatches){
            //check if the sobject Record Is an opportunity Record
            if(sobj.getsobjectType() == oppsobject){
                
                //get An instance Of the opportunity Record using The Id
                opportunity opp = new opportunity(id = sobj.id);
                
                //set The Opportunity stage as Closed lost
                opp.stagename = 'closedlost';
                
                //Add Each opportunity To The opplist
                opplist.add(opp);
                
            }
        }
        
        //iterate Through The each batch of Sobject Records That are Passed From The Start Method
        for(sobject sobj:sobjectsprocessedinBatches){
            //check if the sobject Record Is an opportunity Record
            if(sobj.getsobjectType() == caseSobject){
                
                //get An instance Of the opportunity Record using The Id
                case cs = new case(id = sobj.id);
                
                //check if the Escalated Checkbox is False
                if(cs.IsEscalated == false){
                
                //set The case Escalated checkbox To True
                cs.IsEscalated = true;
                    
                }
                
                //check If The SLAViolation is picked as No
                if(cs.SLAViolation__c != 'Yes'){
                    //set The SLAViolation as Yes
                    cs.SLAViolation__c = 'yes';
                }
                
                //Add Each opportunity To The opplist
                caselist.add(cs);
                
            }
        }
        
        //check if there are opportunities and cases in their respective lists
        if(!opplist.isEmpty()){
            update opplist;
        }
        
        if(!caselist.isEmpty()){
            update caselist;
        }
  
    }
    
    public void finish(database.batchablecontext bc){
        //Lets Keep This Optional
    }
        
        

}