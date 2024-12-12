public class DataValidationUtility_Yash {  
    public static Boolean isValidEmail(String email) {
        // Add email validation logic here
        return email != null && email.contains('@');
    }
}