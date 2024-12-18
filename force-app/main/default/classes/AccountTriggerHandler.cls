public class AccountTriggerHandler {
    //public static void beforeInsert(List<Account> newAccounts) {
        // helper.doTask1();
        // helper.doTask2();
    //}
    public static void beforeUpdate(List<Account> oldAccounts, List<Account> newAccounts, Map<ID, Account> oldAccountMap, Map<ID, Account> newAccountMap) {
        //Update Last Owner and Last Owner Change date when account owner changes. These fields were requested by Rich Flati 5/4/2022.
        for (Account a : newAccounts){
            if(a.OwnerId!=oldAccountMap.get(a.Id).OwnerId){
                a.Last_Owner__c = oldAccountMap.get(a.Id).OwnerId;
                a.Last_Owner_Change_Date__c = Date.today();
            }
            if(a.SDR_Owner__c!=oldAccountMap.get(a.Id).SDR_Owner__c){
                a.Last_SDR_Change_Date__c = Date.today();
            }
            //Update date account moved to ABM and date account moved to not ABM
            if(a.Account_Type__c!=oldAccountMap.get(a.Id).Account_Type__c){
                if(((a.Account_Type__c=='ABM' || a.Account_Type__c=='Expand') && oldAccountMap.get(a.Id).Account_Type__c !='ABM' && oldAccountMap.get(a.Id).Account_Type__c !='Expand' )){
                    a.ABM_Key_Account_Current_Date__c = Date.today();
                }else if((oldAccountMap.get(a.Id).Account_Type__c =='ABM' || oldAccountMap.get(a.Id).Account_Type__c =='Expand') && a.Account_Type__c!='ABM' && a.Account_Type__c!='Expand' ){
                    a.Date_Acct_Updated_to_Not_ABM__c = Date.today();
                }
            }
        }
    }
    //public static void beforeDelete(List<Account> oldAccounts, Map<ID, Account> oldAccountMap) {
        // helper.doTask5();
        // helper.doTask1();
    //}
    //public static void afterInsert(List<Account> newAccounts, Map<ID, Account> newAccountMap) {
    //} 

     public static void afterUpdate(List<Account> oldAccounts, List<Account> newAccounts, Map<ID, Account> oldAccountMap, Map<ID, Account> newAccountMap) {
        List<Account> acctsWithOwnerorSDRChange = new List<Account>();
        for ( Account a : newAccounts)
        {
            if(a.OwnerId!=oldAccountMap.get(a.Id).OwnerId || a.SDR_Owner__c!=oldAccountMap.get(a.Id).SDR_Owner__c){
                acctsWithOwnerorSDRChange.add(a);
            }
        }        
        if(!acctsWithOwnerorSDRChange.isEmpty()){
            //find Contacts Related to account with wrong owner also don't change any that had an activity in the last 7 days.
            List<Contact> contactsToUpdate = new List<Contact>();
            Date SevenDaysAgo = DATE.TODAY().adddays(-7);
            List<Contact> contactsWithNewOwner = [SELECT Id, OwnerId, Suggested_Record_Owner__c from CONTACT where                                             
                                                  AccountId in :acctsWithOwnerorSDRChange
                                                  AND Wrong_Owner__c=true
                                                  AND (Owner_Status__c=false or LastActivityDate<:SevenDaysAgo OR LastActivityDate=null or OwnerId='' or OWNER.NAME='Kris Gabert')
                                                  ];
            Database.executeBatch(new ContactOwnerFixer(contactsWithNewOwner));
            //for(Contact c : contactsWithNewOwner){
            //    if(c.OwnerId!=c.Suggested_Record_Owner__c){
            //        c.OwnerId=c.Suggested_Record_Owner__c;
            //        contactsToUpdate.add(c);
            //    }
            //}
            //if(!contactsToUpdate.isEmpty()){
            //    update contactsToUpdate;
            //}
            //find Leads Related to account with wrong owner also don't change any that had an activity in the last 7 days. Wrong Owner ensures we don't move any in a queue.
            List<Lead> leadsToUpdate = new List<Lead>();
            List<Lead> leadsWithNewOwner = [SELECT Id, OwnerId, Suggested_Record_Owner__c from Lead where IsConverted=false 
                                            AND Wrong_Owner__c=true
                                            AND algnlta__Matched_Account__c in :acctsWithOwnerorSDRChange
                                            AND (Owner_Status__c=false or LastActivityDate<:SevenDaysAgo OR LastActivityDate=null or OWNER.NAME='Kris Gabert')
                                           ];
            Database.executeBatch(new LeadOwnerFixer(leadsWithNewOwner));
            /* for(Lead l : leadsWithNewOwner){
                if(l.OwnerId!=l.Suggested_Record_Owner__c){
                    l.OwnerId=l.Suggested_Record_Owner__c;
                    leadsToUpdate.add(l);
                }
            }
            if(!leadsToUpdate.isEmpty()){
                update leadsToUpdate;
            } */
    }
}

    //public static void afterDelete(List<Account> oldAccounts, Map<ID, Account> oldAccountMap) {
        // helper.doTask3();
        // helper.doTask1();
    //}
    //public static void afterUndelete(List<Account> newAccounts, Map<ID, Account> newAccountMap) {
        // helper.doTask4();
        // helper.doTask2();
    //}
    //for testing test class execution
   
    Account acc = [select id, name from Account Limit 1]; 
    
    list<Account>listOfAccounts = [select id, name from account limit 100];
// execute the logic if the size of the account list is greater than zero

}