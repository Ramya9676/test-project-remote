public class RandomStringGenerator {
    
    // Method to generate a random string of a given length
    public static String generateRandomString(Integer length) {
        final String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        String result = '';
        for (Integer i = 0; i < length; i++) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            result += chars.substring(idx, idx + 1);
        }
        return result;
    }
    
    // Example usage
    public static void exampleUsage() {
        Integer stringLength = 15;
        String randomString = generateRandomString(stringLength);
        System.debug('Generated Random String: ' + randomString);
    }
}