public class ramya {
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
                
            }
        } else {
            system.debug('hello');
        }
    }
}