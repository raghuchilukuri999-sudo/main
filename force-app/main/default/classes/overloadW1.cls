public class overloadW1 {
    
    public integer sum(integer a ,integer b){
        integer result = a+b;
        system.debug('The Result'+result);
        return result;
    }
    
      public integer sum(integer a ,integer b,integer c){
        integer result = a+b+c;
        system.debug('The Result'+result);
        return result;
    }

}