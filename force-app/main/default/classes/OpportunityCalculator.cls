public class OpportunityCalculator {
    // Method to calculate total amount of closed won opportunities for a given account
    public static Decimal calculateTotalClosedWonAmount(Id accountId) {
        // Query to get all closed won opportunities for the given account
        List<Opportunity> closedWonOpportunities = [SELECT Amount FROM Opportunity WHERE AccountId = :accountId AND StageName = 'Closed Won'];
        
        // Initialize total amount
        Decimal totalAmount = 0;
        
        // Loop through the opportunities and sum up the amounts
        for (Opportunity opp : closedWonOpportunities) {
            totalAmount += opp.Amount;
        }
        
        // Return the total amount
        return totalAmount;
    }
}