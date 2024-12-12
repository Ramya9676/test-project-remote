@isTest
public class schedAccountParentOfCustomerUpdateTest {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2029';
    static testmethod void testScheduledJob() {
        // Create account that is not parent of a customer and set Parent_of_Customer__c=true
        Account acct = new Account(Name='Test Account',Parent_of_Customer__c=true);
        insert acct;
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new schedAccountParentOfCustomerUpdate());
        // Stopping the test will run the job synchronously
        Test.stopTest();
        // Now that the scheduled job has executed,
        // check that Parent_of_Customer__c has been changed to false
        System.assertEquals(1,[SELECT Count() from Account where Parent_of_Customer__c=false]);
    }
}