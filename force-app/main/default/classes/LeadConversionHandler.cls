public with sharing class LeadConversionHandler {
    // Method to convert leads that meet certain criteria
    public static void convertQualifiedLeads() {
        List<Lead> leadsToConvert = [SELECT Id, IsConverted, Company FROM Lead WHERE IsConverted = false AND Company != null];

        for (Lead lead : leadsToConvert) {
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(lead.Id);
            lc.setDoNotCreateOpportunity(true);  // Set to true if you don't want to create an opportunity

            // Perform the conversion
            Database.LeadConvertResult result = Database.convertLead(lc);
            if (!result.isSuccess()) {
                System.debug('Lead conversion failed for Lead ID: ' + lead.Id);
            }
        }
    }
}