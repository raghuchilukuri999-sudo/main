public class This4Account {

    public This4Bank bank; // Variable to store the Bank object

    // Constructor that accepts a Bank object
    public This4Account(This4Bank bank) {
        this.bank = bank; // Assign the current instance of the bank
        System.debug('Account is created in the bank: ' + bank.bankName);  // Access bankName from the bank object
    }
}