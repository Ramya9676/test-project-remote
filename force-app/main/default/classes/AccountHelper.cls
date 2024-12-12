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
    }

    public static void updateAccountIndustry(String accId, String industry) {
        if (String.isNotBlank(accId) && String.isNotBlank(industry)) {
            try {
                Account acc = [SELECT Id, Name, Industry FROM Account WHERE Id = :accId LIMIT 1];
                acc.Industry = industry;
                update acc;
            } catch (QueryException e) {
                System.debug('Account not found: ' + e.getMessage());
                throw new CustomException('Account not found with Id: ' + accId);
            } catch (DmlException e) {
                System.debug('Error updating account: ' + e.getMessage());
                throw new CustomException('Failed to update account industry: ' + e.getMessage());
            }
        } else {
            throw new CustomException('Account Id and industry cannot be null or blank');
        }
    }

    // Custom exception for more informative error handling
    public class CustomException extends Exception {}
}