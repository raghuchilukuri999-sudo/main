public virtual class arthparent {
    
    //method
    public integer add(integer a, integer b){
    
    integer result = a + b;
    system.debug('the result is'+ result);
    return result;
}
    
        //method
    public integer sub(integer a, integer b){
    
    integer result = a - b;
    system.debug('the result is'+ result);
    return result;
}
    
        //method
    public integer multiply(integer a, integer b){
    
    integer result = a * b;
    system.debug('the result is'+ result);
    return result;
}
    
        //method
    public integer remainder(integer a, integer b){
    
    integer result = system.math.mod(a,b);
    system.debug('the result is'+ result);
    return result;
}

}