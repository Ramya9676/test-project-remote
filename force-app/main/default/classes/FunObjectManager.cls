public class FunObjectManager {

    // Method to insert a new Fun__c record
    public static void insertFunRecord(String funName, String mobileNo, String email, Date eventDate, String currencyCode) {
        Fun__c newFunObj = new Fun__c();
        
        // Set field values
        newFunObj.Name = funName;             // Fun Name
        newFunObj.Mobile_No__c = mobileNo;    // Mobile No
        newFunObj.Email__c = email;           // Email
        newFunObj.Date__c = eventDate;        // Date (renamed eventDate to avoid conflict)
        newFunObj.CurrencyIsoCode = currencyCode; // Currency (renamed currencyCode to avoid conflict)
        
        try {
            // Insert the record
            insert newFunObj;
        } catch (DmlException e) {
            // Handle errors
            System.debug('Error inserting record: ' + e.getMessage());
        }
    }

    // Method to update an existing Fun__c record by Id
    public static void updateFunRecord(Id recordId, String mobileNo, String email, Date eventDate, String currencyCode) {
        // Get the existing record
        Fun__c existingFunObj = [SELECT Id, Mobile_No__c, Email__c, Date__c, CurrencyIsoCode FROM Fun__c WHERE Id = :recordId LIMIT 1];
        
        // Update the fields
        existingFunObj.Mobile_No__c = mobileNo;
        existingFunObj.Email__c = email;
        existingFunObj.Date__c = eventDate;
        existingFunObj.CurrencyIsoCode = currencyCode;
        
        try {
            // Update the record
            update existingFunObj;
        } catch (DmlException e) {
            // Handle errors
            System.debug('Error updating record: ' + e.getMessage());
        }
    }

    // Method to query Fun__c records by currency
    public static List<Fun__c> queryFunRecords(String currencyCode) {
        // Query records based on currency
        List<Fun__c> funRecords = [SELECT Id, Name, Mobile_No__c, Email__c, Date__c, CurrencyIsoCode FROM Fun__c WHERE CurrencyIsoCode = :currencyCode];
        
        return funRecords;
    }
}