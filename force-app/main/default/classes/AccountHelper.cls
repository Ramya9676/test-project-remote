// Sample Apex Class without bugs
public class AccountHelper {
    public static void createAccount(String accName) {
        if (String.isNotBlank(accName)) {
            try {
                // Check if an account with the same name already exists
                List<Account> existingAccounts = [SELECT Id FROM Account WHERE Name = :accName LIMIT 1];
                if (existingAccounts.isEmpty()) {
                    Account acc = new Account(Name = accName);
                    insert acc;
                } else {
                    System.debug('Account with the given name already exists.');
                }
            } catch (DmlException e) {
                System.debug('Error inserting account: ' + e.getMessage());
                throw new CustomException('Failed to create account: ' + e.getMessage());
            }
        } else {
            throw new CustomException('Account name cannot be null or blank');
        }
//test
    }
