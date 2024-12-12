@isTest
public class AccountManagerLekhyaTest {
 
    @isTest
    static void testCreateAccount() {
        // Arrange
        String accountName = 'Test Account';
 
        // Act
        Test.startTest();
        AccountManagerLekhya.createAccount(accountName);
        Test.stopTest();
 
        // Assert
        Account createdAccount = [SELECT Id, Name FROM Account WHERE Name = :accountName LIMIT 1];
        System.assertNotEquals(null, createdAccount, 'Account should be created');
    }
 
    @isTest
    static void testUpdateAccountName() {
        // Arrange
        String originalName = 'Original Name';
        String newName = 'Updated Name';
        AccountManagerLekhya.createAccount(originalName);
        Account createdAccount = [SELECT Id, Name FROM Account WHERE Name = :originalName LIMIT 1];
 
        // Act
        Test.startTest();
        AccountManagerLekhya.updateAccountName(createdAccount.Id, newName);
        Test.stopTest();
 
        // Assert
        Account updatedAccount = [SELECT Id, Name FROM Account WHERE Id = :createdAccount.Id LIMIT 1];
        System.assertEquals(newName, updatedAccount.Name, 'Account name should be updated');
    }
 
    @isTest
    static void testDeleteAccount() {
        // Arrange
        String accountName = 'Account to Delete';
        AccountManagerLekhya.createAccount(accountName);
        Account createdAccount = [SELECT Id FROM Account WHERE Name = :accountName LIMIT 1];
 
        // Act
        Test.startTest();
        AccountManagerLekhya.deleteAccount(createdAccount.Id);
        Test.stopTest();
 
        // Assert
        List<Account> deletedAccount = [SELECT Id FROM Account WHERE Id = :createdAccount.Id];
        System.assertEquals(0, deletedAccount.size(), 'Account should be deleted');
    }
}