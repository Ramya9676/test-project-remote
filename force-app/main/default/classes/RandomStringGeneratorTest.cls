@isTest
public class RandomStringGeneratorTest {

    @isTest
    static void testGenerateRandomString() {
        // Test case for valid input
        Integer testLength = 15; // Length of the string to generate
        String generatedString = RandomStringGenerator.generateRandomString(testLength);
        
        // Assert the generated string is not null and matches the desired length
        System.assertNotEquals(null, generatedString, 'Generated string should not be null');
        System.assertEquals(testLength, generatedString.length(), 'Generated string should match the requested length');
        
        // Assert that the string contains only valid characters
        String validChars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        for (Integer i = 0; i < generatedString.length(); i++) {
            System.assert(validChars.contains(generatedString.substring(i, i + 1)), 
                          'Generated string contains invalid characters');
        }

        // Test edge case: Length 0
        String emptyString = RandomStringGenerator.generateRandomString(0);
        System.assertEquals('', emptyString, 'Generated string should be empty for length 0');
    }

    @isTest
    static void testExampleUsage() {
        // Test the example usage method to ensure it executes without errors
        Test.startTest();
        RandomStringGenerator.exampleUsage();
        Test.stopTest();
        // Since the exampleUsage method logs the output, ensure it doesn't cause any exceptions.
    }
}