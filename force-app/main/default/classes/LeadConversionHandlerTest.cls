@isTest
private class LeadConversionHandlerTest {
    @testSetup
    static void setupTestData() {
        // Create test leads
        Lead lead1 = new Lead(FirstName = 'Jane', LastName = 'Smith', Company = 'Test Company 1', Status = 'Open');
        Lead lead2 = new Lead(FirstName = 'John', LastName = 'Doe', Company = 'Test Company 2', Status = 'Open');
        insert new List<Lead>{lead1, lead2};
    }

    @isTest
    static void testConvertQualifiedLeads() {
        // Ensure test setup is correct
        List<Lead> leads = [SELECT Id, IsConverted FROM Lead WHERE IsConverted = false];
        System.assertEquals(2, leads.size(), 'Initial lead count should be 2');
        
        Test.startTest();
        LeadConversionHandler.convertQualifiedLeads();
        Test.stopTest();
        
        // Verify leads are converted
        List<Lead> convertedLeads = [SELECT Id, IsConverted FROM Lead WHERE IsConverted = true];
        System.assertEquals(2, convertedLeads.size(), 'All leads should be converted');
    }
}