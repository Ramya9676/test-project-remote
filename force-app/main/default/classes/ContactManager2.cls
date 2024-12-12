public class ContactManager2 {
    public static void createContact(String firstName, String lastName) {
        // Logic to create a new contact
    }

    public static void updateContact(String contactId, String newLastName) {
        // Logic to update contact information
    }

    public static List<Contact> getContacts() {
        // Logic to retrieve a list of contacts
        return [SELECT Id, FirstName, LastName FROM Contact LIMIT 10];
    }
}