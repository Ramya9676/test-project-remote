public class vindhyaobj {
    
    // Method to insert record dynamically with Name, Mobile, and Email
    public static void insertCustomObjectRecord(String name, String mobile, String email) {
        // Create a new record of your custom object
        vindyaobj__c customObj = new vindyaobj__c();
        
        // Assign values to fields
        customObj.Name = name;            // Name field (standard)
        customObj.Mobile_No__c = mobile;     // Mobile field (custom)
        customObj.Email__c = email;       // Email field (custom)
        
        try {
            // Attempt to insert the record
            insert customObj;
        } catch (DmlException e) {
            // Catch the DML exception to handle validation rule failure or other errors
            if (e.getMessage().contains('MOBILE_INVALID_ERROR')) {
                // Output the custom label if validation rule fails for Mobile field
                System.debug(Label.Error_Message_Invalid_Mobile);  // Using custom label in Apex
            } else {
                // General error handling for other exceptions
                System.debug('Error inserting record: ' + e.getMessage());
            }
        }
    }
}