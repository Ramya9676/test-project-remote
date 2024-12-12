public class InstituteManager {

    // Create a new Institute__c record
    public static Institute__c createInstitute(String instituteName, String email, String mobileNo, Id ownerId) {
        // Create the Institute__c record and set the necessary fields
        Institute__c newInstitute = new Institute__c(
            Name = instituteName,           // Institute Name (Required)
            Email__c = email,               // Email field
            Mobile_No__c = mobileNo,        // Mobile Number field
            OwnerId = ownerId               // Owner (Lookup to User)
        );

        try {
            // Insert the record, Student_ID__c will be auto-generated
            insert newInstitute;
            return newInstitute;  // Return the created record
        } catch (DmlException e) {
            System.debug('Error inserting Institute record: ' + e.getMessage());
            return null;
        }
    }
}