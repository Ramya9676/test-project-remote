// Sample Test Class for AccountHelper
@isTest
public class AccountHelperTest {
    @isTest
    static void testCreateAccount() {
        // Setup test data
        String testName = 'Test Account';

        // Call the method
        Test.startTest();
        AccountHelper.createAccount(testName);
        Test.stopTest();

        // Verify that the account was created
        Account createdAccount = [SELECT Name FROM Account WHERE Name = :testName LIMIT 1];
        System.assertNotEquals(null, createdAccount, 'Account should have been created');
        System.assertEquals(testName, createdAccount.Name, 'Account name should match');
    }

    @isTest
    static void testCreateAccountWithNull() {
        try {
            Test.startTest();
            AccountHelper.createAccount(null);
            Test.stopTest();
            System.assert(false, 'Expected exception for null account name was not thrown');
        } catch (AccountHelper.CustomException e) {
            System.assertEquals('Account name cannot be null or blank', e.getMessage(), 'Exception message should match expected message');
        }
    }

    @isTest
    static void testUpdateAccountIndustry() {
        // Setup test data
        Account acc = new Account(Name = 'Test Update Industry');
        insert acc;

        String newIndustry = 'Technology';

        // Call the method
        Test.startTest();
        AccountHelper.updateAccountIndustry(acc.Id, newIndustry);
        Test.stopTest();

        // Verify that the industry was updated
        Account updatedAccount = [SELECT Industry FROM Account WHERE Id = :acc.Id];
        System.assertEquals(newIndustry, updatedAccount.Industry, 'Industry should have been updated');
    }

    @isTest
    static void testUpdateAccountIndustryWithInvalidId() {
        try {
            Test.startTest();
            AccountHelper.updateAccountIndustry('invalidId', 'Finance');
            Test.stopTest();
            System.assert(false, 'Expected exception for invalid account ID was not thrown');
        } catch (AccountHelper.CustomException e) {
            System.assertEquals('Account not found with Id: invalidId', e.getMessage(), 'Exception message should match expected message');
        }
    }
}