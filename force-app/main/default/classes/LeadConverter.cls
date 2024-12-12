public class LeadConverter {
    public static Database.LeadConvertResult convertLead(Id leadId) {
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(leadId);
        lc.setDoNotCreateOpportunity(true);
        return Database.convertLead(lc);
    }
}