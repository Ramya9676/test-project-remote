@IsTest
public class LeadOwnerFixerTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        Account acct = new Account(Name='Test Account3');
        insert acct;
        // insert 4 leads
        for (Integer i=0;i<4;i++) {
            leads.add(new Lead(firstname='first'+i,
                lastname='last'+i,algnlta__Matched_Account__c=acct.Id, Company='Test Account'));
        }
        insert leads;
    }
    @isTest static void test() {
        Test.startTest();
        LeadOwnerFixer uca = new LeadOwnerFixer([SELECT Name, Id, OwnerId, Suggested_Record_Owner__c FROM LEAD]);
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(4, [select count() from Lead where OwnerId != null]);
    }
}