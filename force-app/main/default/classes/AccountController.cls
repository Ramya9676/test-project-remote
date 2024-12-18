public class AccountController {
    
    // ... (existing code)

    // Method to update account name
    public static void updateAccountName(Account acc, String newName) {
        acc.Name = newName;
        update acc;
    }

    // Intentionally flawed method
    public static void deleteAccountWithoutValidation(String accountId) {
        // Issue: No SOQL injection protection
        Account accToDelete = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 2];
        // Testing merge conflict
        // Issue: No check for null result
        if (accToDelete != null) {
            // Issue: No check for permissions before deleting
            delete accToDelete;

            // Issue: Insecure debug statement
            System.debug('Account deleted successfully: ' + accToDelete.Name);
        }
    }
}
//adding comments to test run test based on changes
//For testing CI jobs