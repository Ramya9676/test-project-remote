@isTest
public class LeadConverterTest {
    static testMethod void testConvertLead() {
        Lead lead = new Lead(FirstName = 'John', LastName = 'Doe', Company = 'Test Company');
        insert lead;
        
        Database.LeadConvertResult result = LeadConverter.convertLead(lead.Id);
        
        
    }
}