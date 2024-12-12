public class ContactManagers {

    // Method to create a new Contact
    public static void createContact(String firstName, String lastName, String email) {
        Contact newContact = new Contact();
        newContact.FirstName = firstName;
        newContact.LastName = lastName;
        newContact.Email = email;
        
        // Insert the new Contact record
        insert newContact;
    }
    
    // Method to retrieve a Contact by ID
    public static Contact getContactById(Id contactId) {
        return [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Id = :contactId LIMIT 1];
    }
    
    // Method to update an existing Contact
    public static void updateContact(Id contactId, String newEmail) {
        Contact contactToUpdate = getContactById(contactId);
        if (contactToUpdate != null) {
            contactToUpdate.Email = newEmail;
            update contactToUpdate;
        }
    }
    
    // Method to delete a Contact
    public static void deleteContact(Id contactId) {
        Contact contactToDelete = getContactById(contactId);
        if (contactToDelete != null) {
            delete contactToDelete;
        }
    }
}