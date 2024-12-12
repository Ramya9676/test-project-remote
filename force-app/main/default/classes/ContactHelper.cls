// Sample Apex Class for Contact Management
public class ContactHelper {
    public static void createContact(String lastName, String accountId) {
        if (String.isNotBlank(lastName) && String.isNotBlank(accountId)) {
            try {
                // Check if the account exists
                Account account = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
                
                // Create and insert contact
                Contact contact = new Contact(LastName = lastName, AccountId = account.Id);
                insert contact;
            } catch (QueryException e) {
                System.debug('Account not found: ' + e.getMessage());
                throw new CustomException('Account not found with Id: ' + accountId);
            } catch (DmlException e) {
                System.debug('Error inserting contact: ' + e.getMessage());
                throw new CustomException('Failed to create contact: ' + e.getMessage());
            }
        } else {
            throw new CustomException('Last name and Account ID cannot be null or blank');
        }
    }

    // Custom exception for better error handling
    public class CustomException extends Exception {}
}