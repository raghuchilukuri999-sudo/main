//****This KeyWord is used As A Parameter In A Constructor From One Class To Another Class
//****here we Have Taken Student related Details
//*******This Class Will be Used As A constructor Name For Another Class i.e ThisKeyword4usageAnotherclass
// ******i.e company class And Using This keyword In That Class We Are Gonna use 
// the constructor of That Class As An Input Parameter Of This Class Constructor used On That Class As A Constructor and in this class constructor also
public class ThisKeywordusage4 {
    
    //instance variables
    public ThisKeyword4usageAnotherclass cmp;
    //here we have taken the other class/object data as the dat type
    //here we have taken Variable name of other class related i.e ThisKeyword4usageAnotherclass(company related)
    
    //Parameterzed Constructor
    //In This We Are To refer/use The Other Class Input/local Parameters In This Constructor by Using 'This' Keyword
    
    public ThisKeywordusage4(ThisKeyword4usageAnotherclass cmp){
        this.cmp = cmp;
        system.debug('===The Student Got Selected in The Campus '+ cmp.name);
    }
}