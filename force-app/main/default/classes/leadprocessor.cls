public class leadprocessor implements database.batchable<Sobject> {
    
    public database.querylocator start(database.batchablecontext bc){
        //fetch the Records of leads For which You Wanna Auto update The Leadsource To 'Dreamforce' which are not Already having its ststus as 'Dreamforce'
        string query = 'select id,firstName,Lastname,Leadsource From Lead where Leadsource <> \'Dreamforce\'';
        return database.getquerylocator(query);
    }
    
    public void execute(Database.batchablecontext bc,list<lead> processedleads){
        
        //Creating A list To bulk Update The Leadsource Of processedleads Records That Came From The Start Method
        list<lead> leadlist = new list<lead>();
        
        //iterate Through the processedleads Records That Came From The Start Method And Update Thier Leadsource To 'DreamForce'
        for(lead l : processedleads){
            
            //Firstly Entering The Value Of Which You wanna Want In Leadsoucre
            l.leadsource = 'Dreamforce';
            
            //Adding This processedleads Records That Are In Varibale 'l' now  to The Leadlist
            leadlist.add(l);
            
        }
        //checking If There are Actually Any leadRecords in The leadlist(i.e Checking That If Our Adding Is Succesful Or not) 
        if(!leadlist.isempty()){
            //now Updating all The Lead Records In The List
            update leadlist;
        }
    }
    
    public void finish(Database.batchablecontext bc){
        //This is Keeping As Optional
    }

}