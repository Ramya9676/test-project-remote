public with sharing class ContactManager {
    // Method to create a new contact and associate it with an account
    public static Contact createContact(String firstName, String lastName, Id accountId) {
        if (String.isEmpty(firstName) || String.isEmpty(lastName) || accountId == null) {
            throw new IllegalArgumentException('All parameters are required.');
        }
        
        Contact newContact = new Contact(
            FirstName = firstName,
            LastName = lastName,
            AccountId = accountId
        );
        
        insert newContact;
        return newContact;
    }
}