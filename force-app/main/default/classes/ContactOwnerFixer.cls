public class ContactOwnerFixer implements  Database.Batchable<sObject>{
    public List<Contact> contactsToUpdateOwner = new List<Contact>();
    public ContactOwnerFixer(List<Contact> contactsToUpdate){
        contactsToUpdateOwner=contactsToUpdate;
    }
    public List<SObject> start(Database.BatchableContext context)
    {
        return contactsToUpdateOwner;
    }
    public void execute(Database.BatchableContext context, List<Contact> scope){
        List<Contact> contacts = new List<Contact>();
        for (contact c : scope){
                            if(c.OwnerId!=c.Suggested_Record_Owner__c){
                    c.OwnerId=c.Suggested_Record_Owner__c;
                    contacts.add(c);
                }
        }
        update contacts;
        
    }
        public void finish(Database.BatchableContext context){
        System.debug(' records processed. Shazam!');
    }
}