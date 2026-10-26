@isTest
private class LookupRollupSummaryForAccountTriggerTest {

    @isTest
    static void testInsertTrigger() {
        // Create a CarType record
        Car_Type__c carType = new Car_Type__c(Name = 'Sedan');
        insert carType;

        // Create Customer records associated with the CarType
        Customer__c customer1 = new Customer__c(Name = 'Customer 1', Car_Type__c = carType.Id, Amount_Paid__c = 100);
        Customer__c customer2 = new Customer__c(Name = 'Customer 2', Car_Type__c = carType.Id, Amount_Paid__c = 200);
        insert new List<Customer__c>{customer1, customer2};

        // Fetch the updated CarType record
        carType = [SELECT Total_Number_of_Customers__c, Total_Amount_Paid_By_The_customers__c, Average_Amount_Paid_by_The_customers__c, 
                          Minimum_Discount_Given__c, Maximum_Discount_Given__c 
                   FROM Car_Type__c WHERE Id = :carType.Id];

        // Debug the fetched CarType record
        System.debug('CarType after insert: ' + carType);

        // Assert the calculated values
        System.assertEquals(2, carType.Total_Number_of_Customers__c);
        System.assertEquals(300, carType.Total_Amount_Paid_By_The_customers__c);
        System.assertEquals(150, carType.Average_Amount_Paid_by_The_customers__c);
        System.assertEquals(100, carType.Minimum_Discount_Given__c);
        System.assertEquals(200, carType.Maximum_Discount_Given__c);
    }

    @isTest
    static void testUpdateTrigger() {
        // Create a CarType record
        Car_Type__c carType = new Car_Type__c(Name = 'SUV');
        insert carType;

        // Create Customer records associated with the CarType
        Customer__c customer1 = new Customer__c(Name = 'Customer 1', Car_Type__c = carType.Id, Amount_Paid__c = 100);
        Customer__c customer2 = new Customer__c(Name = 'Customer 2', Car_Type__c = carType.Id, Amount_Paid__c = 200);
        insert new List<Customer__c>{customer1, customer2};

        // Update the Customer records
        customer1.Amount_Paid__c = 150;
        update customer1;

        // Fetch the updated CarType record
        carType = [SELECT Total_Number_of_Customers__c, Total_Amount_Paid_By_The_customers__c, Average_Amount_Paid_by_The_customers__c, 
                          Minimum_Discount_Given__c, Maximum_Discount_Given__c 
                   FROM Car_Type__c WHERE Id = :carType.Id];

        // Debug the fetched CarType record
        System.debug('CarType after update: ' + carType);

        // Assert the calculated values
        System.assertEquals(2, carType.Total_Number_of_Customers__c);
        System.assertEquals(350, carType.Total_Amount_Paid_By_The_customers__c);
        System.assertEquals(175, carType.Average_Amount_Paid_by_The_customers__c);
        System.assertEquals(150, carType.Minimum_Discount_Given__c);
        System.assertEquals(200, carType.Maximum_Discount_Given__c);
    }

    @isTest
    static void testDeleteTrigger() {
        // Create a CarType record
        Car_Type__c carType = new Car_Type__c(Name = 'Truck');
        insert carType;

        // Create Customer records associated with the CarType
        Customer__c customer1 = new Customer__c(Name = 'Customer 1', Car_Type__c = carType.Id, Amount_Paid__c = 100);
        Customer__c customer2 = new Customer__c(Name = 'Customer 2', Car_Type__c = carType.Id, Amount_Paid__c = 200);
        insert new List<Customer__c>{customer1, customer2};

        // Delete one of the Customer records
        delete customer1;

        // Fetch the updated CarType record
        carType = [SELECT Total_Number_of_Customers__c, Total_Amount_Paid_By_The_customers__c, Average_Amount_Paid_by_The_customers__c, 
                          Minimum_Discount_Given__c, Maximum_Discount_Given__c 
                   FROM Car_Type__c WHERE Id = :carType.Id];

        // Debug the fetched CarType record
        System.debug('CarType after delete: ' + carType);

        // Assert the calculated values
        System.assertEquals(1, carType.Total_Number_of_Customers__c);
        System.assertEquals(200, carType.Total_Amount_Paid_By_The_customers__c);
        System.assertEquals(200, carType.Average_Amount_Paid_by_The_customers__c);
        System.assertEquals(200, carType.Minimum_Discount_Given__c);
        System.assertEquals(200, carType.Maximum_Discount_Given__c);
    }

    @isTest
    static void testUndeleteTrigger() {
        // Create a CarType record
        Car_Type__c carType = new Car_Type__c(Name = 'Convertible');
        insert carType;

        // Create Customer records associated with the CarType
        Customer__c customer1 = new Customer__c(Name = 'Customer 1', Car_Type__c = carType.Id, Amount_Paid__c = 100);
        insert customer1;

        // Delete and then undelete the Customer record
        delete customer1;
        undelete customer1;

        // Fetch the updated CarType record
        carType = [SELECT Total_Number_of_Customers__c, Total_Amount_Paid_By_The_customers__c, Average_Amount_Paid_by_The_customers__c, 
                          Minimum_Discount_Given__c, Maximum_Discount_Given__c 
                   FROM Car_Type__c WHERE Id = :carType.Id];

        // Debug the fetched CarType record
        System.debug('CarType after undelete: ' + carType);

        // Assert the calculated values
        System.assertEquals(1, carType.Total_Number_of_Customers__c);
        System.assertEquals(100, carType.Total_Amount_Paid_By_The_customers__c);
        System.assertEquals(100, carType.Average_Amount_Paid_by_The_customers__c);
        System.assertEquals(100, carType.Minimum_Discount_Given__c);
        System.assertEquals(100, carType.Maximum_Discount_Given__c);
    }
}