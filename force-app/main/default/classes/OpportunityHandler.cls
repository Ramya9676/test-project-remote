public class OpportunityHandler {
    public static void closeOpportunity(Opportunity opp) {
        opp.StageName = 'Closed Won';
        update opp;
    }
}