public class InstituteEmailSender {

    // Method to send email to the email address entered in the Email__c field
    public static void sendEmail(Institute__c instituteRecord) {
        // Get the email address from the Email__c field of the Institute__c record
        String recipientEmail = instituteRecord.Email__c;
        
        // Check if the email address is valid
        if (recipientEmail != null && recipientEmail != '') {
            // Create a new instance of SingleEmailMessage
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            // Set the recipient email address
            mail.setToAddresses(new String[] { recipientEmail });
            
            // Set the email subject
            mail.setSubject('Welcome to the Institute');
            
            // Set the email body (you can customize this message)
            mail.setPlainTextBody('Dear ' + instituteRecord.Alias_Name__c + ',\n\n'
                                  + 'Thank you for registering with our institute. We are excited to have you on board.\n\n'
                                  + 'Best regards,\nThe Institute Team');
            
            // Send the email
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}