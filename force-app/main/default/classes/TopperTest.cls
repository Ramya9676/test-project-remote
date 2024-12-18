@isTest
public class TopperTest {
    
    @isTest
    public static void testTopperClass() {
        // Create a Topper object with sample data
        Topper topper = new Topper('John', 95);
        
        // Call the method and store the result
        String result = topper.getTopperDetails();
        
        // Verify the result
        System.assertEquals('Topper: John with score: 95', result, 'The topper details should match the expected string.');
    }
}