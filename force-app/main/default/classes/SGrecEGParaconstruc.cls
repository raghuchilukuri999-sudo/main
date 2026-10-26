public class SGrecEGParaconstruc {
    
    //variables
    decimal length;
    decimal breadth;
    
    //para-construct
    public SGrecEGParaconstruc(decimal l,decimal b){
        length = l;
        breadth = b;
    }
    
    //method
    public void area(){
       decimal a = length*breadth;
        system.debug('priniting area a '+ a);
    }

}