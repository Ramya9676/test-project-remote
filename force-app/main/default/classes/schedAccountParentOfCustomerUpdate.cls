public class schedAccountParentOfCustomerUpdate implements Schedulable {
    public void execute(SchedulableContext ctx) {
        //Find Accounts where Parent of Customer is True, but since it's a new scheduled day, maybe that's not true now
        List<Account> acctParentofCustomerTrue = new List<Account>([SELECT Id from ACCOUNT WHERE Parent_of_Customer__c=true]);
        //Find Accounts hwere Parent of Customer should be true, but maybe it isn't yet set correctly
        List<Account> acctParentofCustomerShouldBeTrue = new List<Account>([SELECT ParentId from ACCOUNT WHERE 
                                                  Customer_Status__c in ('Current','Late Renewal') AND ParentId!=NULL]);
        //Group the parentIDs into a set so the list doesn't have duplicates
        Set<Id> acctParentofCustomerShouldBeTrueIds = new Set<Id>();
        For(Account a : acctParentofCustomerShouldBeTrue){
            acctParentofCustomerShouldBeTrueIds.add(a.ParentId);
        }   
        // Loop through each account where parent of customer is true, and mark to false if not in the list that should be true
        List<Account> acctToUpdate = New List<Account>();
        For(Account a : acctParentofCustomerTrue){
            if(!acctParentofCustomerShouldBeTrueIds.contains(a.Id)){
                a.Parent_of_Customer__c=false;
                acctToUpdate.add(a);
                    }
    	}
        
        List<Account> acctToChangeParentofCustToTrue = new List<Account>([SELECT Id from ACCOUNT WHERE Parent_of_Customer__c=false AND Id in :acctParentofCustomerShouldBeTrueIds]);
        for(Account b : acctToChangeParentofCustToTrue){
                b.Parent_of_Customer__c=true;
                acctToUpdate.add(b);
        }
        update acctToUpdate;
	}
}