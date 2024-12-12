@isTest
private class OpportunityServiceTest {
    @testSetup
    static void setupTestData() {
        // Create test opportunities
        Opportunity opp1 = new Opportunity(Name = 'High Value 1', Amount = 50000, StageName = 'Negotiation/Review', CloseDate = Date.today().addDays(30));
        Opportunity opp2 = new Opportunity(Name = 'High Value 2', Amount = 200000, StageName = 'Proposal/Price Quote', CloseDate = Date.today().addDays(30));
        Opportunity opp3 = new Opportunity(Name = 'Low Value', Amount = 30000, StageName = 'Prospecting', CloseDate = Date.today().addDays(30));
        insert new List<Opportunity>{opp1, opp2, opp3};
    }

    @isTest
    static void testMarkHighValueOpportunitiesAsWon() {
        Test.startTest();
        OpportunityService.markHighValueOpportunitiesAsWon(100000);
        Test.stopTest();
        
        // Verify results
        Opportunity opp1 = [SELECT StageName FROM Opportunity WHERE Name = 'High Value 1'];
        Opportunity opp2 = [SELECT StageName FROM Opportunity WHERE Name = 'High Value 2'];
        Opportunity opp3 = [SELECT StageName FROM Opportunity WHERE Name = 'Low Value'];
        
        System.assertEquals('Negotiation/Review', opp1.StageName, 'Opp1 should not be marked as Closed Won');
        System.assertEquals('Closed Won', opp2.StageName, 'Opp2 should be marked as Closed Won');
        System.assertEquals('Prospecting', opp3.StageName, 'Opp3 should remain unchanged');
    }
}