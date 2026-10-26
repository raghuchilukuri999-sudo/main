public class Opportunitytriggerhelper {

    public static void beforedelete(Map<id,opportunity> oppoldmap){
        
        id loggedinuser = userinfo.getuserid();
        
        //where are Querying like this: if a logged in user a group member of group 'sales team' is such a list empty or something if somethere
        //then isempty becomes false and ! makes it true so issalesteammember becomes true
        Boolean issalesteammember = ![select id,groupid from groupmember where userorgroupid =: loggedinuser and group.name = 'sales Team'].isempty();
        
        for(opportunity opp : oppoldmap.values()){
            if(!issalesteammember && opp.StageName != 'closed Lost'){
                opp.adderror('The opportunity cannot be deleted as stage is not \'closed Lost\' and logged in user is not a Member of \'sales Team\'');
            }
        }
    }
    
}