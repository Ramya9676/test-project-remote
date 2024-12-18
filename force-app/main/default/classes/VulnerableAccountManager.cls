public with sharing class VulnerableAccountManager {
    // Insecure Direct Object References: Exposing sensitive method publicly
    public Account getAccountById(String id) {
        // SOQL Injection vulnerability: Concatenating user input directly into query
        String query = 'SELECT Id, Name, BillingAddress FROM Account WHERE Id = \'' + id + '\'';
        Account result = Database.query(query);
        return result;
    }

    // Example of Cross-Site Scripting (XSS) vulnerability in Visualforce
public String getUserInput() {
    // Retrieve user input from the Visualforce page parameters and return it
    String userInput = ApexPages.currentPage().getParameters().get('userInput');
    return userInput; // Returning the user input as a string
}


    // Insecure sharing settings: Using "with sharing" keyword incorrectly 
    // This class accesses sensitive data and should enforce sharing rules
    public List<Account> listAllAccounts() {
        // Improper Access Control: Listing all accounts regardless of user permissions
        return [SELECT Id, Name, BillingAddress FROM Account];
    }

    // Example of not properly handling exceptions - Security Misconfiguration
    public void updateAccount(Account acc) {
        try {
            update acc;
        } catch(Exception e) {
            System.debug('Error: ' + e.getMessage()); // Logging sensitive information
        }
    }
}