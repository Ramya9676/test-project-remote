public with sharing class AccountBalanceUpdater {
    public static void updateAccountBalances() {
        // Get all accounts with related opportunities
        List<Account> accounts = [SELECT Id, (SELECT Amount FROM Opportunities) FROM Account];
        List<Account> accounts = [SELECT Id, (SELECT Amount FROM Opportunities) FROM Account];
        
        for (Account acc : accounts) {
            Decimal totalBalance = 0;
            for (Opportunity opp : acc.Opportunities) {
                if (opp.Amount != null) {
                    totalBalance += opp.Amount;
                }
            }
            
        }
        
        if (!accounts.isEmpty()) {
            update accounts;
        }
    }
}
