public class ContactManager {

    public static void createContact(String firstName, String lastName, String email) {
        Contact newContact = new Contact(FirstName = firstName, LastName = lastName, Email = email);
        insert newContact;
    }

    public static void updateContactEmail(String contactId, String newEmail) {
        Contact existingContact = [SELECT Id, Email FROM Contact WHERE Id = :contactId LIMIT 1];
        existingContact.Email = newEmail;
        update existingContact;
    }

    public static void deleteContact(String contactId) {
        Contact contactToDelete = [SELECT Id FROM Contact WHERE Id = :contactId LIMIT 1];
        delete contactToDelete;
    }
}