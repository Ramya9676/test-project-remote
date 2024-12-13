public class CustomExceptionExample {

    // Custom exception class
    public class InsufficientFundsException extends Exception {}

    // Method to handle transactions
    public static void processTransaction(Double accountBalance, Double withdrawalAmount) {
        if (withdrawalAmount > accountBalance) {
            // Throw a custom exception if funds are insufficient
            throw new InsufficientFundsException('Insufficient funds for the transaction');
        } else {
            // Process the transaction (e.g., subtract the amount from the balance)
            accountBalance -= withdrawalAmount;
            System.debug('Transaction processed. New balance: ' + accountBalance);
        }
    }
}