@IsTest
public class ContactOwnerFixerTest {
    @testSetup
    static void setup() {
        List<Contact> contacts = new List<Contact>();
        Account acct = new Account(Name='Test Account3');
        insert acct;
        // insert 4 contacts
        for (Integer i=0;i<4;i++) {
            contacts.add(new Contact(firstname='first'+i,
                lastname='last'+i,AccountId=acct.Id));
        }
        insert contacts;
    }
    @isTest static void test() {
        Test.startTest();
        ContactOwnerFixer uca = new ContactOwnerFixer([SELECT Name, Id, OwnerId, Suggested_Record_Owner__c FROM CONTACT]);
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(4, [select count() from Contact where OwnerId != null]);
    }
}