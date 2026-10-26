@IsTest
private class StudentGetterSetterExampleTestClass {
    @IsTest
    private static void studTest() {
        // Calling the static variable
        System.debug('====The College Name is ' + StudentGetterSetterExample.collegeName);
        
        // Calling the static method 
        StudentGetterSetterExample.changeCollegeName();
        
        // Creating the object
        StudentGetterSetterExample stud = new StudentGetterSetterExample();
        
        // Calling the setter methods
        stud.setName('Prakash');
        stud.setStudentId('ahvjb4248634');
        stud.setBranch('Civil');
        
        // Asserting the results using System.assertEquals
        System.assertEquals('Prakash', stud.getName());
        System.assertEquals('ahvjb4248634', stud.getStudentId());
        System.assertEquals('Civil', stud.getBranch());
        System.assertEquals('Sri Nava Durga College', StudentGetterSetterExample.collegeName);
    }
}