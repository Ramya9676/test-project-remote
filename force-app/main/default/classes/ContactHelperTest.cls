// Sample Test Class for ContactHelper
@isTest
public class ContactHelperTest {
    @isTest
    static void testCreateContact() {
        // Setup test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        String testLastName = 'Smith';

        // Call the method
        Test.startTest();
        ContactHelper.createContact(testLastName, testAccount.Id);
        Test.stopTest();

        // Verify that the contact was created
        Contact createdContact = [SELECT LastName, AccountId FROM Contact WHERE LastName = :testLastName AND AccountId = :testAccount.Id LIMIT 1];
        System.assertNotEquals(null, createdContact, 'Contact should have been created');
        System.assertEquals(testLastName, createdContact.LastName, 'Contact last name should match');
        System.assertEquals(testAccount.Id, createdContact.AccountId, 'Contact account ID should match');
    }

    @isTest
    static void testCreateContactWithInvalidAccount() {
        try {
            Test.startTest();
            ContactHelper.createContact('Doe', 'invalidAccountId');
            Test.stopTest();
            System.assert(false, 'Expected exception for invalid account ID was not thrown');
        } catch (ContactHelper.CustomException e) {
            System.assertEquals('Account not found with Id: invalidAccountId', e.getMessage(), 'Exception message should match expected message');
        }
    }

    @isTest
    static void testCreateContactWithNullValues() {
        try {
            Test.startTest();
            ContactHelper.createContact(null, null);
            Test.stopTest();
            System.assert(false, 'Expected exception for null values was not thrown');
        } catch (ContactHelper.CustomException e) {
            System.assertEquals('Last name and Account ID cannot be null or blank', e.getMessage(), 'Exception message should match expected message');
        }
    }
}