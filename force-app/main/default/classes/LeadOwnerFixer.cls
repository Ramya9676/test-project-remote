public class LeadOwnerFixer implements  Database.Batchable<sObject>{
    public List<Lead> leadsToUpdateOwner = new List<Lead>();
    public LeadOwnerFixer(List<Lead> leadsToUpdate){
        leadsToUpdateOwner=leadsToUpdate;
    }
    public List<SObject> start(Database.BatchableContext context)
    {
        return leadsToUpdateOwner;
    }
    public void execute(Database.BatchableContext context, List<Lead> scope){
        List<Lead> leads = new List<Lead>();
        for (lead c : scope){
                            if(c.OwnerId!=c.Suggested_Record_Owner__c){
                    c.OwnerId=c.Suggested_Record_Owner__c;
                    leads.add(c);
                }
        }
        update leads;
        
    }
        public void finish(Database.BatchableContext context){
        System.debug(' records processed. Shazam!');
    }
}