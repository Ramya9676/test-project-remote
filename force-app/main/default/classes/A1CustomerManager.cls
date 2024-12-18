public class A1CustomerManager {
    
    // Method to retrieve customer records
    public static List<Contact> getCustomerByName(String customerName) {
        return [
            SELECT Id, FirstName, LastName, Email 
            FROM Contact 
            WHERE Name LIKE :('%' + customerName + '%')
        ];
    }

    // Method to create a new customer
    public static Contact createCustomer(String firstName, String lastName, String email) {
        Contact newCustomer = new Contact(
            FirstName = firstName,
            LastName = lastName,
            Email = email
        );
        insert newCustomer;
        return newCustomer;
    }

    // Method to update a customer's email
    public static void updateCustomerEmail(Id customerId, String newEmail) {
        Contact customer = [SELECT Id, Email FROM Contact WHERE Id = :customerId];
        customer.Email = newEmail;
        update customer;
    }

    // Method to delete a customer record
    public static void deleteCustomer(Id customerId) {
        Contact customer = [SELECT Id FROM Contact WHERE Id = :customerId];
        delete customer;
    }
}
//demo class