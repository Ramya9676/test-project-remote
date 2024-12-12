@isTest
public class VindhyaObjHandlerTest {

    // Test method for inserting valid record
    @isTest
    public static void testInsertValidRecord() {
        // Arrange: Prepare valid input data
        String name = 'John Doe';
        String mobile = '1234567890'; // Valid mobile number
        String email = 'john.doe@example.com';

        // Act: Call the insert method
        Test.startTest(); // Start test to isolate governor limits
        vindhyaobj.insertCustomObjectRecord(name, mobile, email);
        Test.stopTest(); // End test

        // Assert: Verify that the record has been inserted
        vindyaobj__c insertedRecord = [SELECT Name, Mobile_No__c, Email__c FROM vindyaobj__c WHERE Name = :name LIMIT 1];
        System.assertNotEquals(null, insertedRecord, 'Record should have been inserted');
        System.assertEquals(mobile, insertedRecord.Mobile_No__c, 'Mobile number should be valid');
        System.assertEquals(email, insertedRecord.Email__c, 'Email should match the input');
    }

    // Test method for handling invalid mobile number (to trigger validation rule error)
    @isTest
    public static void testInsertInvalidMobile() {
        // Arrange: Prepare invalid input data (Mobile number with less than 10 digits)
        String name = 'Jane Doe';
        String mobile = '12345'; // Invalid mobile number (less than 10 digits)
        String email = 'jane.doe@example.com';

        // Act: Call the insert method and expect it to throw an error due to validation rule
        Test.startTest(); // Start test to isolate governor limits
        
        // Use a try-catch block to simulate the exception handling behavior in the main method
        try {
            vindhyaobj.insertCustomObjectRecord(name, mobile, email);
        } catch (Exception e) {
            System.assert(e.getMessage().contains('MOBILE_INVALID_ERROR'), 'Exception message should contain validation error message.');
        }
        
        Test.stopTest(); // End test
    }
    
    // Test for DML Exception Handling (General exception case)
    @isTest
    public static void testInsertWithOtherError() {
        // Arrange: Prepare input data
        String name = 'Invalid Record';
        String mobile = '1234567890'; // Valid mobile number
        String email = 'invalid.email'; // Invalid email format to trigger error

        // Act: Call the insert method
        Test.startTest(); // Start test to isolate governor limits
        try {
            vindhyaobj.insertCustomObjectRecord(name, mobile, email);
        } catch (Exception e) {
            System.assert(e.getMessage().contains('Error inserting record'), 'Expected DML exception for invalid email format.');
        }
        Test.stopTest(); // End test
    }
}