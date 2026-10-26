@isTest
private class ThisKeywordUsage2TestClass {
    @isTest
    private static void unittest(){
        // Creating an instance/object for the class 
        ThisKeyword2ndUsageExample obj = new ThisKeyword2ndUsageExample();
        Integer feesAfterDiscount = obj.getFeesAfterDiscount(50000, 90); 
        
        // Debugging the result
        System.debug('=== The Fees After Discount == ' + feesAfterDiscount);

        // Verifying the results of actual values we got by debugging and the expected values
        System.assertEquals(25000, feesAfterDiscount);
    }
}