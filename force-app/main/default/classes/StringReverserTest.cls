@isTest
public class StringReverserTest {
    @isTest
    static void testReverseString() {
        // Test with a normal string
        String input = 'Salesforce';
        String expectedOutput = 'ecrofeslaS';
        String actualOutput = StringReverser.reverseString(input);
        System.assertEquals(expectedOutput, actualOutput, 'The reverseString method failed for a valid input.');

        // Test with an empty string
        input = '';
        expectedOutput = '';
        actualOutput = StringReverser.reverseString(input);
        System.assertEquals(expectedOutput, actualOutput, 'The reverseString method failed for an empty string.');

        // Test with a null string
        input = null;
        expectedOutput = null;
        actualOutput = StringReverser.reverseString(input);
        System.assertEquals(expectedOutput, actualOutput, 'The reverseString method failed for a null input.');
    }
}