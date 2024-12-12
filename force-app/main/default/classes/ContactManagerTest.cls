@isTest
private class ContactManagerTest {
    @testSetup
    static void setupTestData() {
        // Create a test account to use for contact creation
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
    }

    @isTest
    static void testCreateContact() {
        Account testAccount = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];
        
        Test.startTest();
        Contact createdContact = ContactManager.createContact('John', 'Doe', testAccount.Id);
        Test.stopTest();
        
        // Verify the contact was created
        System.assertNotEquals(null, createdContact.Id, 'Contact should be created successfully');
        System.assertEquals('John', createdContact.FirstName, 'FirstName should be John');
        System.assertEquals('Doe', createdContact.LastName, 'LastName should be Doe');
        System.assertEquals(testAccount.Id, createdContact.AccountId, 'AccountId should match the test account');
    }

    @isTest
    static void testCreateContactInvalidParameters() {
        try {
            Test.startTest();
            ContactManager.createContact('', 'Doe', null);
            Test.stopTest();
            System.assert(false, 'Exception should have been thrown for invalid parameters');
        } catch (IllegalArgumentException e) {
            System.assertEquals('All parameters are required.', e.getMessage(), 'Expected exception message should match');
        }
    }
}