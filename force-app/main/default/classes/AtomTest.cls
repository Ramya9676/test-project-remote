@isTest
public class AtomTest {
    // Test method to verify the combineStrings functionality
    @isTest
    static void testCombineStrings() {
        // Arrange
        Atom atom = new Atom();
        String input1 = 'Hello';
        String input2 = 'World';

        // Act
        String result = atom.combineStrings(input1, input2);

        // Assert
        System.assertEquals('Hello World', result, 'The combined string did not match the expected value');
    }
}