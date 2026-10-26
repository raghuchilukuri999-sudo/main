@istest
private class TestClassForOVerRidingMethod {
    @istest
    private static void OverRideTest(){
        //here we are debugging any one of the child and
//by which we can debug the parent class also

//creating an instance/object for the child class1
OverRidngMethodChildClass cc1 = new OverRidngMethodChildClass();
//calling the instance methods from the child class1
integer result1 = cc1.getAUTOloanROI();
integer result2 = cc1.getHOMEloanROI();
integer result3 = cc1.getPersonalloanROI();
boolean result4 = cc1.haslockerfacility();
boolean result5 = cc1.hasOverDraftFacility();

//creating an instance For the Child Class2
OverRidingMethodChildclass2 cc2 = new OverRidingMethodChildclass2();
//calling all instance methods From child class 2
integer result6 = cc2.getAUTOloanROI();
integer result7 = cc2.getHOMEloanROI();
integer result8 = cc2.getPersonalloanROI();
boolean result9 = cc2.haslockerfacility();
boolean result10 = cc2.hasOverDraftFacility();
         system.assertequals(3,result1);
         system.assertequals(5,result2);
         system.assertequals(2,result3);
         system.assertequals(false,result4);
         system.assertequals(true,result5);
         system.assertequals(8,result6);
         system.assertequals(10,result7);
         system.assertequals(7,result8);
         system.assertequals(true,result9);
         system.assertequals(true,result10);
    }

}