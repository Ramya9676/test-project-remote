public class AccountManagerLekhya {
 
    public static void createAccount(String accountName) {
        Account newAccount = new Account(Name = accountName);
        insert newAccount;
    }
 
    public static void updateAccountName(String accountId, String newName) {
        Account existingAccount = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        existingAccount.Name = newName;
        update existingAccount;
    }
 
    public static void deleteAccount(String accountId) {
        Account accountToDelete = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
        delete accountToDelete;
    }
}