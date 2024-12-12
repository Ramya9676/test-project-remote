public class schedAccountCurrentMetricsDaily implements Schedulable {
    public static void execute(SchedulableContext ctx) {
        //set ARR_End_of_Month__c daily on each account with ARR and set to 0 on others where it is populated but should not be anymore
        List<Account> accountsToUpdate = new List<Account>();
        List<Account> accountsToUpdateCodeScan = new List<Account>();
        List<Account> accountsToUpdateRM = new List<Account>();
        List<Account> accountsToUpdateSubscriptions = new List<Account>();
        List<Account> accountsToUpdateSupport = new List<Account>();
        List<Account> accountsToUpdateVault = new List<Account>();
        Date LastDayofMonth = DATE.TODAY().addmonths(1).toStartOfMonth().adddays(-1);
        //Set the ARR on the account and end of month regardless of the accounting bin
        for( AggregateResult ar : [SELECT sum(Annual_Revenue__c), Opportunity.AccountId
                                   from OpportunityLineItem
                                   where Recurring_Revenue__c=true AND Opportunity.StageName='Closed Won'
                                   AND Item_End_Date__c >= :LastDayofMonth
                                   AND ((Item_Start_Date__c <= :LastDayofMonth) 
                                        OR (Item_Start_Date__c = null
                                            AND Opportunity.Subscription_Start_Date__c <=:LastDayofMonth ))
                                   GROUP BY Opportunity.AccountId
                                  ]){
                                      Decimal total = Decimal.valueOf(String.valueOf(ar.get('expr0')));
                                      accountsToUpdate.add( new Account(Id = String.valueOf(ar.get('AccountId')),ARR_End_of_Month__c = total,
                                                                        ARR_CodeScan_EOM__c=0,
                                                                        QTY_CodeScan_EOM__c=0,
                                                                        ARR_Record_Migrator_EOM__c=0,
                                                                        QTY_Record_Migrator_EOM__c=0,
                                                                        ARR_Subscriptions_EOM__c=0,
                                                                        QTY_Subscriptions_EOM__c=0,
                                                                        ARR_Support_EOM__c=0,
                                                                        QTY_Support_EOM__c=0,
                                                                        ARR_Vault_EOM__c=0,
                                                                        QTY_Vault_EOM__c=0));
                                  }
        Decimal ARRCodeScan=0;
        Decimal QTYCodeScan=0;
        Decimal ARRRM=0;
        Decimal QTYRM=0;
        Decimal ARRSubscriptions=0;
        Decimal QTYSubscriptions=0;
        Decimal ARRSupport=0;
        Decimal QTYSupport=0;
        Decimal ARRVault=0;
        Decimal QTYVault=0;
        //Update each of the accounting bin level variables for ARR and QTY at the account level
        for( AggregateResult arARR : [SELECT sum(Annual_Revenue__c), sum(Accounting_Bin_Quantity__c), Opportunity.AccountId, Accounting_Bin_Override__c
                                      from OpportunityLineItem
                                      where Recurring_Revenue__c=true AND Opportunity.StageName='Closed Won'
                                      AND Item_End_Date__c >= :LastDayofMonth
                                      AND ((Item_Start_Date__c <= :LastDayofMonth) 
                                           OR (Item_Start_Date__c = null
                                               AND Opportunity.Subscription_Start_Date__c <=:LastDayofMonth ))
                                      GROUP BY Opportunity.AccountId, Accounting_Bin_Override__c
                                     ]){
                                         If(String.valueOf(arARR.get('Accounting_Bin_Override__c'))=='CodeScan'){
                                             ARRCodeScan = Decimal.valueOf(String.valueOf(arARR.get('expr0')));
                                             QTYCodeScan = Decimal.valueOf(String.valueOf(arARR.get('expr1')));
                                             accountsToUpdateCodeScan.add( new Account(Id = String.valueOf(arARR.get('AccountId')),ARR_CodeScan_EOM__c = ARRCodeScan,QTY_CodeScan_EOM__c = QTYCodeScan));
                                         }
                                         // Implementation Revenue Section Commented Out as it should not have ARR
                                         //If(String.valueOf(arARR.get('Accounting_Bin_Override__c'))=='Implementation Revenue'){
                                         //    Decimal ARRCodeScan = Decimal.valueOf(String.valueOf(arARR.get('expr0')));
                                         //    Decimal QTYCodeScan = Decimal.valueOf(String.valueOf(arARR.get('expr1')));
                                         //    accountsToUpdate.add( new Account(Id = String.valueOf(arARR.get('AccountId')),ARR_CodeScan_EOM__c = ARRCodeScan,QTY_CodeScan_EOM__c = QTYCodeScan));
                                         //}
                                         If(String.valueOf(arARR.get('Accounting_Bin_Override__c'))=='Record Migrator'){
                                             ARRRM = Decimal.valueOf(String.valueOf(arARR.get('expr0')));
                                             QTYRM = Decimal.valueOf(String.valueOf(arARR.get('expr1')));
                                             accountsToUpdateRM.add( new Account(Id = String.valueOf(arARR.get('AccountId')),ARR_Record_Migrator_EOM__c = ARRRM,QTY_Record_Migrator_EOM__c = QTYRM));
                                         }
                                         If(String.valueOf(arARR.get('Accounting_Bin_Override__c'))=='Subscriptions'){
                                             ARRSubscriptions = Decimal.valueOf(String.valueOf(arARR.get('expr0')));
                                             QTYSubscriptions = Decimal.valueOf(String.valueOf(arARR.get('expr1')));
                                             accountsToUpdateSubscriptions.add( new Account(Id = String.valueOf(arARR.get('AccountId')),ARR_Subscriptions_EOM__c = ARRSubscriptions,QTY_Subscriptions_EOM__c = QTYSubscriptions));
                                         }
                                         If(String.valueOf(arARR.get('Accounting_Bin_Override__c'))=='Support'){
                                             ARRSupport = Decimal.valueOf(String.valueOf(arARR.get('expr0')));
                                             QTYSupport = Decimal.valueOf(String.valueOf(arARR.get('expr1')));
                                             accountsToUpdateSupport.add( new Account(Id = String.valueOf(arARR.get('AccountId')),ARR_Support_EOM__c = ARRSupport,QTY_Support_EOM__c = QTYSupport));
                                         }
                                         If(String.valueOf(arARR.get('Accounting_Bin_Override__c'))=='Vault'){
                                             ARRVault = Decimal.valueOf(String.valueOf(arARR.get('expr0')));
                                             QTYVault = Decimal.valueOf(String.valueOf(arARR.get('expr1')));
                                             accountsToUpdateVault.add( new Account(Id = String.valueOf(arARR.get('AccountId')),ARR_Vault_EOM__c = ARRVault,QTY_Vault_EOM__c = QTYVault));
                                         }
                                     }
        
        Set<Id> acctsWithARREOM = new Set<Id>();
        For (Account acc : accountsToUpdate){
            acctsWithARREOM.add(acc.Id);
        }
        for(Account a : [SELECT Id, ARR_End_of_Month__c,ARR_CodeScan_EOM__c,QTY_CodeScan_EOM__c
                         ,ARR_Record_Migrator_EOM__c,QTY_Record_Migrator_EOM__c
                         ,ARR_Subscriptions_EOM__c,QTY_Subscriptions_EOM__c
                         ,ARR_Support_EOM__c,QTY_Support_EOM__c
                         ,ARR_Vault_EOM__c,QTY_Vault_EOM__c
                         from Account where ARR_End_of_Month__c<>0 AND ARR_End_of_Month__c!=null AND ID NOT IN :acctsWithARREOM]){
                             a.ARR_End_of_Month__c=0;
                             a.ARR_CodeScan_EOM__c=0;
                             a.QTY_CodeScan_EOM__c=0;
                             a.ARR_Record_Migrator_EOM__c=0;
                             a.QTY_Record_Migrator_EOM__c=0;
                             a.ARR_Subscriptions_EOM__c=0;
                             a.QTY_Subscriptions_EOM__c=0;
                             a.ARR_Support_EOM__c=0;
                             a.QTY_Support_EOM__c=0;
                             a.ARR_Vault_EOM__c=0;
                             a.QTY_Vault_EOM__c=0;
                             
                             accountsToUpdate.add(a);
                         }
        
        Map<Id, Account> mapAccountsToUpdate = new Map<Id,Account>(accountsToUpdate);
        
        if (!accountsToUpdateCodeScan.isEmpty()) {
            for(Account a : accountsToUpdateCodeScan){
                mapAccountsToUpdate.get(a.Id).put('ARR_CodeScan_EOM__c', a.ARR_CodeScan_EOM__c);
                mapAccountsToUpdate.get(a.Id).put('QTY_CodeScan_EOM__c', a.QTY_CodeScan_EOM__c);
            }}
        if (!accountsToUpdateRM.isEmpty()) {
            for(Account a : accountsToUpdateRM){
                mapAccountsToUpdate.get(a.Id).put('ARR_Record_Migrator_EOM__c', a.ARR_Record_Migrator_EOM__c);
                mapAccountsToUpdate.get(a.Id).put('QTY_Record_Migrator_EOM__c', a.QTY_Record_Migrator_EOM__c);
            }}
        if (!accountsToUpdateSubscriptions.isEmpty()) {
            for(Account a : accountsToUpdateSubscriptions){
                mapAccountsToUpdate.get(a.Id).put('ARR_Subscriptions_EOM__c', a.ARR_Subscriptions_EOM__c);
                mapAccountsToUpdate.get(a.Id).put('QTY_Subscriptions_EOM__c', a.QTY_Subscriptions_EOM__c);
            }}
        if (!accountsToUpdateSupport.isEmpty()) {
            for(Account a : accountsToUpdateSupport){
                mapAccountsToUpdate.get(a.Id).put('ARR_Support_EOM__c', a.ARR_Support_EOM__c);
                mapAccountsToUpdate.get(a.Id).put('QTY_Support_EOM__c', a.QTY_Support_EOM__c);
            }}
        if (!accountsToUpdateVault.isEmpty()) {    
            for(Account a : accountsToUpdateVault){
                mapAccountsToUpdate.get(a.Id).put('ARR_Vault_EOM__c', a.ARR_Vault_EOM__c);
                mapAccountsToUpdate.get(a.Id).put('QTY_Vault_EOM__c', a.QTY_Vault_EOM__c);
            }}
        
        update mapAccountsToUpdate.values();
    }
}