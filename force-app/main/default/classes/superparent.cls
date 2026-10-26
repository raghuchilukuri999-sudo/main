public virtual class superparent {
    
    //instance variables
    public string firstname;
    public string lastname;
    public string course;
    
    //default constructor so give default values
    public superparent(){
        string firstname = 'raghu';
        string lastname = 'ram';
        string course = 'python';
        }
    //para-consruct
    public superparent(string firstname,string lastname,string course){
        this.firstname = firstname;
        this.lastname = lastname;
        this.course = course;
    }
    
    //methods
    public virtual string getstddetails(){
        string fullname = this.firstname + ''+this.lastname;
        return fullname;
    }
    public virtual string getstdcourse(){
        string course = this.course;
        return course;
    }

}