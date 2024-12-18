@isTest
public class AccountTriggerHandlerTest {
    @testSetup
    static void setup() {
        Profile[] p = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        User usr = new User(FirstName='First',
                            LastName='Last',
                            Email = 'puser000@autorabit.com',
                            Username = 'puser000@autorabit.com' + System.currentTimeMillis(),
                            CompanyName = 'TEST',
                            Title = 'title',
                            Alias = 'alias',
                            TimeZoneSidKey = 'America/Los_Angeles',
                            EmailEncodingKey = 'UTF-8',
                            LanguageLocaleKey = 'en_US',
                            LocaleSidKey = 'en_US',
                           ProfileId=p[0].Id);
        insert usr;
        User usr1 = new User(FirstName='First',
                            LastName='Last',
                            Email = 'puser001@autorabit.com',
                            Username = 'puser001@autorabit.com' + System.currentTimeMillis(),
                            CompanyName = 'TEST',
                            Title = 'title',
                            Alias = 'alias',
                            TimeZoneSidKey = 'America/Los_Angeles',
                            EmailEncodingKey = 'UTF-8',
                            LanguageLocaleKey = 'en_US',
                            LocaleSidKey = 'en_US',
                           ProfileId=p[0].Id);
        insert usr1;
        Account acct = new Account(Name='Test Account3');
        insert acct;
        Contact cont = new Contact(LastName='Contact',
                                   FirstName='Test',
                                   AccountId=acct.Id,
                                  LeadSource='ABM');
        insert cont;
        Lead ld1 = new Lead(LastName='Lead',
                                   FirstName='Test',
                                   algnlta__Matched_Account__c=acct.Id,
                           			Company='Test Company',
                          			LeadSource='ABM' );
        insert ld1;
    }
    @isTest static void testAssignAccountToUser(){
        //Perform test
        //Test that account ownership set causes leads and contacts to be assigned to same owner
        List<Account> AcctToUpdate = new List<Account> ([SELECT Id, OwnerId from Account]);
        List<User> UserToUpdate = new List<User> ([Select Id, LastName from User where Email='puser000@autorabit.com' LIMIT 1]);
        AcctToUpdate[0].OwnerId = UserToUpdate[0].Id;
        AcctToUpdate[0].SDR_Owner__c = UserToUpdate[0].Id;
        AcctToUpdate[0].Account_Type__c='ABM';
        Test.startTest();
        update AcctToUpdate;
        List<Lead> LeadsToCheck = new List<Lead>([SELECT OWNERID, Suggested_Record_Owner__c, Wrong_Owner__c, IsConverted, algnlta__Matched_Account__c, LastActivityDate FROM LEAD]);
		system.debug('lead owner ' + LeadsToCheck[0].OwnerId + ' ' + LeadsToCheck[0].Suggested_Record_Owner__c + ' ' + LeadsToCheck[0].Wrong_Owner__c + ' ' + LeadsToCheck[0].IsConverted + ' algnlta__Matched_Account__c ' + LeadsToCheck[0].algnlta__Matched_Account__c + ' LastActivityDate ' + LeadsToCheck[0].LastActivityDate);
        List<Contact> ContactsToCheck = new List<Contact>([SELECT OWNERID FROM Contact]);
        Test.stopTest();
		system.debug('contact owner ' + ContactsToCheck[0].OwnerId);
        system.debug('AcctToUpdate[0].OwnerId ' + AcctToUpdate[0].OwnerId);
        
        //ContactOwnerFixer and LeadOwnerFixer are batchable now, so I'm commenting out these asserts. Each needs to be tested in its own test class. The batchable methods cannot finish here.
		//System.assertEquals(1,[Select count() from Contact WHERE OwnerId=:AcctToUpdate[0].OwnerId]);  
		//System.assertEquals(1,[Select count() from Lead WHERE OwnerId=:AcctToUpdate[0].OwnerId]);
        //Test that account ownership  update causes Last Owner and Last Owner Change Date to be updated.
        List<User> UserToUpdate1 = new List<User> ([Select Id, LastName from User where Email='puser001@autorabit.com' LIMIT 1]);
        AcctToUpdate[0].OwnerId = UserToUpdate1[0].Id;
        update AcctToUpdate;
        System.assertEquals(1,[Select count() from Account WHERE Last_Owner__c=:UserToUpdate[0].Id]);
    }
}