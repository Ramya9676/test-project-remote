public class ContactHandler {
    // Method to create a new contact and associate it with an account
    public static Contact createContact(String firstName, String lastName, Id accountId) {
        if (String.isEmpty(firstName) || String.isEmpty(lastName)) {
            throw new IllegalArgumentException('First name and last name cannot be empty');
        }
        
        if (accountId == null) {
            throw new IllegalArgumentException('Account ID cannot be null');
        }

        Contact newContact = new Contact(
            FirstName = firstName,
            LastName = lastName,
            AccountId = accountId
        );
        
        try {
            insert newContact;  // Insert the contact into the database
        } catch (DmlException e) {
            System.debug('Error occurred while inserting contact: ' + e.getMessage());
            throw e;
        }
        
        return newContact;  // Return the newly created contact
    }
}