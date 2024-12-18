public class FutureMethodExample {
    @future
    public static void sendEmailAsync(String emailAddress) {
        // Simulate sending an email asynchronously
        System.debug('Sending email to: ' + emailAddress);
    }
}