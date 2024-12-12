public with sharing class SecureApexClass {

    public List<Account> getMyAccounts() {
        // Only retrieve accounts that the current user has access to
        return [SELECT Id, Name FROM Account];
    }

    public void updateAccount(Account acc) {
        // Only allow updates to accounts that the current user has access to
        Account existingAccount = [SELECT Id FROM Account WHERE Id = :acc.Id LIMIT 1];
        
        if (existingAccount != null) {
            // Perform the update only if the user has access
            update acc;
        } else {
            // Handle unauthorized access
            System.debug('Unauthorized access attempt to update Account.');
        }
    }
}