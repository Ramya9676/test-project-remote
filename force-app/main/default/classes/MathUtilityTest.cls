@isTest
public class MathUtilityTest {
    @isTest
    static void testSquare() {
        // Test with a positive number
        Integer input = 5;
        Integer expectedOutput = 25;
        Integer actualOutput = MathUtility.square(input);
        System.assertEquals(expectedOutput, actualOutput, 'Square of 5 should be 25');
        
        // Test with zero
        input = 0;
        expectedOutput = 0;
        actualOutput = MathUtility.square(input);
        System.assertEquals(expectedOutput, actualOutput, 'Square of 0 should be 0');
        
        // Test with a negative number
        input = -3;
        expectedOutput = 9;
        actualOutput = MathUtility.square(input);
        System.assertEquals(expectedOutput, actualOutput, 'Square of -3 should be 9');
    }
}