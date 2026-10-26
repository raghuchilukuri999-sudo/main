@isTest
public class INNOVAabstractchildclassExampleTest {
    @isTest
    static void testINNOVAabstractchildclassExample() {
        // Create an instance of the child class
        INNOVAabstractchildclassExample car = new INNOVAabstractchildclassExample();
        
        // Test the getCarType method
        String expectedCarType = 'Electrical';
        String actualCarType = car.getCarType();
        System.assertEquals(expectedCarType, actualCarType, 'Car type should be Electrical');
        
        // Test the getCarPrice method
        Integer expectedCarPrice = 50000000;
        Integer actualCarPrice = car.getCarPrice();
        System.assertEquals(expectedCarPrice, actualCarPrice, 'Car price should be 50000000');
        
        // Test the getCarManufacturingYear method
        Integer expectedCarManufacturingYear = 2024;
        Integer actualCarManufacturingYear = car.getCarManufacturingYear();
        System.assertEquals(expectedCarManufacturingYear, actualCarManufacturingYear, 'Car manufacturing year should be 2024');
        
        // Test the getTypeOfGear method
        String expectedTypeOfGear = 'Automated';
        String actualTypeOfGear = car.getTypeOfGear();
        System.assertEquals(expectedTypeOfGear, actualTypeOfGear, 'Type of gear should be Automated');
        
        // Test the hasSunroof method
        Boolean expectedHasSunroof = true;
        Boolean actualHasSunroof = car.hasSunroof();
        System.assertEquals(expectedHasSunroof, actualHasSunroof, 'Car should have a sunroof');
        
        // Test the isFinanceOptionAvailable method
        Boolean expectedIsFinanceOptionAvailable = false;
        Boolean actualIsFinanceOptionAvailable = car.isFinanceOptionAvailable();
        System.assertEquals(expectedIsFinanceOptionAvailable, actualIsFinanceOptionAvailable, 'Finance option should not be available');
        
        // Call the debug method to ensure it runs without errors
        car.debug();
    }
}