public class OpportunityHelper {

    // Method to calculate total amount of closed-won opportunities for an account
    public static Decimal calculateTotalClosedWonAmount(Id accountId) {
        Decimal totalAmount = 0;
        
        // Query closed-won opportunities related to the account
        List<Opportunity> opps = [
            SELECT Amount 
            FROM Opportunity 
            WHERE AccountId = :accountId AND StageName = 'Closed Won'
        ];
        
        // Sum the amounts
        for (Opportunity opp : opps) {
            totalAmount += opp.Amount;
        }
        
        return totalAmount;
    }
}