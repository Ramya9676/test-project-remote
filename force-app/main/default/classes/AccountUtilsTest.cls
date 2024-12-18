@isTest
private class AccountUtilsTest {
    
    @isTest static void testUpdateAccountName() {
        // Create an account
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        // Update the account name
        String newName = 'New Test Account Name';
        AccountUtils.updateAccountName(acc, newName);
        
        // Retrieve the updated account
        Account updatedAcc = [SELECT Name FROM Account WHERE Id = :acc.Id];
        
        // Verify the updated account name
        System.assertEquals(newName, updatedAcc.Name);
    }
}