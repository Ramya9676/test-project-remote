public class ContactUtilityClass_Yash {
    public static void logContactDetails(Contact c) {
        System.debug('Contact Name: ' + c.FirstName + ' ' + c.LastName);
        System.debug('Email: ' + c.Email);
    }
}