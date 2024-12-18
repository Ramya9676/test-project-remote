@isTest
public class AccountControllerTest {
    static testMethod void testUpdateAccountName() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        AccountController.updateAccountName(acc, 'Updated Account');
        
        Account updatedAcc = [SELECT Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Updated Account', updatedAcc.Name);
    }
}