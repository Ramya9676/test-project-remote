public class StringUtils {
    // Method to check if a string is a palindrome
    public static Boolean isPalindrome(String input) {
        if (input == null) {
            return false;
        }
        String cleanedInput = input.replaceAll('[^a-zA-Z0-9]', '').toLowerCase();
        String reversedInput = '';
        for (Integer i = cleanedInput.length() - 1; i >= 0; i--) {
            reversedInput += cleanedInput.substring(i, i + 1);
        }
        return cleanedInput == reversedInput;
    }
}