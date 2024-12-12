@isTest
public class OpportunityHandlerTest {
    static testMethod void testCloseOpportunity() {
        Opportunity opp = new Opportunity(Name = 'Test Opportunity', StageName = 'Open');
        insert opp;
        
        OpportunityHandler.closeOpportunity(opp);
        
        Opportunity closedOpp = [SELECT StageName FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals('Closed Won', closedOpp.StageName);
    }
}