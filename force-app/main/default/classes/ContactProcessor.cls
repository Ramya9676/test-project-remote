public class ContactProcessor {

    // Method to process contacts and update phone numbers based on criteria
    public static void processContacts(List<Contact> contactsToUpdate) {
        for (Contact contact : contactsToUpdate) {
            // Check if the contact meets the criteria for updating phone number
            if (shouldUpdatePhoneNumber(contact)) {
                // Update the phone number (for illustration purposes, we're adding a prefix)
                contact.Phone = '+1-' + contact.Phone;
            }
        }

        // Update the contacts in the database
        update contactsToUpdate;
    }

    // Helper method to determine if a contact's phone number should be updated
    private static Boolean shouldUpdatePhoneNumber(Contact contact) {
        // Add your criteria here based on your business requirements
        // For illustration purposes, let's assume we update phone numbers if the email contains 'example.com'
        return contact.Email != null && contact.Email.contains('example.com');
    }
    
    private static Boolean shouldUpdatePhoneNumber2(Contact contact) {
        // Add your criteria here based on your business requirements
        // For illustration purposes, let's assume we update phone numbers if the email contains 'example.com'
        return contact.Email != null && contact.Email.contains('example.com');
    }
}