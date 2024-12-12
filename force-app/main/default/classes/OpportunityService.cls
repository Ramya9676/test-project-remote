public with sharing class OpportunityService {
    public static void markHighValueOpportunitiesAsWon(Decimal threshold) {
        List<Opportunity> opportunities = [SELECT Id, Amount, StageName FROM Opportunity WHERE Amount > :threshold AND StageName != 'Closed Won'];
        
        for (Opportunity opp : opportunities) {
            opp.StageName = 'Closed Won';
        }
        
        if (!opportunities.isEmpty()) {
            update opportunities;
        }
    }
}