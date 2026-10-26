public class GeneralLoopsPractice {
    
    
    public Static void Loopmethods(){
    
    //if
    integer Officeloginhrs = 10;
    String employeetype = 'contract';
    Long Salary;
    integer workexp = 12;
    string emprank;
    string empinsurance;
    List<string> emprelation = new list<string>{'father','mother','Wife','Children'};
        
    if(employeetype == 'regular'){
        officeloginhrs = 10;
    }
        
        
    //if-else
        if(employeetype == 'contract'){
           Salary  = 56122L;
        }else{
            salary = 782782L;
        }
        
   //if-else-if
        if(workexp >= 20){
           emprank = 'Top Order'; 
        }else if(workexp < 20 && workexp >15){
            emprank = 'First Avg';
            
        }else if(workexp < 15 && workexp>12){
            emprank = 'second Avg';
        }else{
            emprank = 'Lower order';
        }
        
    //Nested if and else
if (emprelation.contains('father') || emprelation.contains('mother')) {
    if (emprelation.contains('Wife')) {
        if (emprelation.contains('Children')) {
            empinsurance = 'Full Coverage';             // Parents + Wife + Children
        } else {
            empinsurance = 'Marital Coverage';          // Parents + Wife, no Children
        }
    } else {
        if (emprelation.contains('Children')) {
            empinsurance = 'Unclassified Coverage';     // Parent + Children, no Wife
        } else {
            if (emprelation.contains('father') && emprelation.contains('mother')) {
                empinsurance = 'Parent Insurance Coverage'; // Both parents, no Wife, no Children
            } else {
                empinsurance = 'Bachelor Coverage';     // Single parent, no Wife, no Children
            }
        }
    }
} else {
    empinsurance = 'Unclassified Coverage';             // No parent at all
}
    
    System.debug('The office Loginhrs of the employee is'+officeloginhrs);
    system.debug('The salary of employee is'+salary);
    system.debug('The emprank of the employee is'+emprank);
    system.debug('The coverage Now Is'+empinsurance);
    
    }
}