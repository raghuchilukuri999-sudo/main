public class patientGetterSetterExample {
    
    //instance varibles
    private String Name;
    private String id;
    private string mobileNumber;
    
    //static 
    public static integer Age = 78;
    
    
    //change on static variable so use Static Method
    public static void changeAge(){
        Age = 80;
        System.debug('==The Age is ==='+Age);
        
    }
    
    public patientGetterSetterExample(){
        //No param constr
    }
    
    //We use private for Instance varibles So Use setter and getter
    public void setpid(string Pid){
        this.id = pid;
    }
    
      public void setname(string Name){
        this.Name = Name;
    }
    
    
      public void setMobileNumber(string mbN){
        this.mobileNumber = MbN;
    }
    
    public string getid(){
        return id;
    }
    
        public string getname(){
        return name;
    }
    
        public string getMobileNumber(){
        return mobileNumber;
    }
    
    public void display(){
        system.debug('==='+getid());
        system.debug('==='+getname());
        system.debug('==='+getmobileNumber());
        system.debug('==='+Age);
    }
    

}