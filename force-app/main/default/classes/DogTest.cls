@isTest
private class DogTest {
    @isTest
    static void testDogBehavior() {
        // Create a Dog instance
        Dog obj1 = new Dog();
        obj1.breed = 'German Shepherd';
        obj1.Color = 'Black';
        obj1.age = '5';

        // Test instance variables
        System.assertEquals('German Shepherd',obj1.breed);
        System.assertEquals('Black',obj1.Color);
        System.assertEquals('5',obj1.age);
    }
}