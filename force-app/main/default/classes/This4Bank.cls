public class This4Bank {

    public String bankName; // Name of the bank

    // Constructor to initialize the bank name
    public This4Bank(String name) {
        this.bankName = name;  // Initialize the bank name
        System.debug('Bank Created: ' + this.bankName);

        // Create an Account object and pass this bank instance using 'this'
        This4Account newAccount = new This4Account(this); // Pass the current instance using 'this'
    }
}