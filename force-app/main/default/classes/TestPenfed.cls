public class TestPenfed {

    // Inner class representing a Contact
    public class Contact {
        public String firstName;
        public String lastName;
        public String email;

        public Contact(String firstName, String lastName, String email) {
            this.firstName = firstName;
            this.lastName = lastName;
            this.email = email;
        }
    }

    // List to store contacts
    private List<Contact> contacts;

    // Constructor to initialize the contacts list
    public TestPenfed() {
        contacts = new List<Contact>();
    }

    // Method to add a new contact
    public void addContact(String firstName, String lastName, String email) {
        Contact newContact = new Contact(firstName, lastName, email);
        contacts.add(newContact);
    }

    // Method to update an existing contact's email
    public void updateContactEmail(String firstName, String lastName, String newEmail) {
        for (Contact c : contacts) {
            if (c.firstName == firstName && c.lastName == lastName) {
                c.email = newEmail;
                break;
            }
        }
    }

    // Method to get a list of contacts
    public List<Contact> getContacts() {
        return contacts;
    }
    // Method to display contact information
    public void displayContacts() {
        System.debug('Contacts:');
        for (Contact c : contacts) {
            System.debug('Name: ' + c.firstName + ' ' + c.lastName + ', Email: ' + c.email);
        }
    }

    // Example of a method with conditional logic
    public void displayVipContacts() {
        System.debug('VIP Contacts:');
        for (Contact c : contacts) {
            if (c.email.endsWith('.vip@example.com')) {
                System.debug('Name: ' + c.firstName + ' ' + c.lastName + ', Email: ' + c.email);
            }
        }
    }
 
}