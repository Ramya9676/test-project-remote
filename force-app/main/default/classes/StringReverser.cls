public class StringReverser {
    // Method to reverse a given string
    public static String reverseString(String input) {
        if (input == null) {
            return null;
        }
        String reversed = '';
        for (Integer i = input.length() - 1; i >= 0; i--) {
            reversed += input.charAt(i);
        }
        return reversed;
    }
}