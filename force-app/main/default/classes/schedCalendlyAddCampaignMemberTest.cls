@IsTest
public class schedCalendlyAddCampaignMemberTest {
	@testSetup
  	static void setup() {
        Account acct = new Account(Name='Test Account3');
        insert acct;
        Contact cont = new Contact(LastName='Contact',
                                   FirstName='Test',
                                  AccountId=acct.Id);
        insert cont;
        Campaign camp = new Campaign(Name='G-GLOB-EVENTS-Dreamforce2022');
        insert camp;
        Event ev = new Event(Subject='Intro Call Test 1', WhoId=cont.id, Location='https://calendly.com/events/a93512f5-ac73-49d6-a1ca-125bd22abe3c/microsoft_teams',DurationInMinutes=30,ActivityDateTime=System.today());
        insert ev;
    }
    @IsTest static void SetARRLastFullMonthTest(){
    	// Dummy CRON expression: midnight on March 15.
   		// Because this is a test, job executes
    	// immediately after Test.stopTest().
        String CRON_EXP = '0 0 0 15 3 ? 2029';
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new schedCalendlyAddCampaignMember());
        // Stopping the test will run the job synchronously
        Test.stopTest();
        // Now that the scheduled job has executed,
        // check that Parent_of_Customer__c has been changed to false
        System.assertEquals(1,[SELECT Count() from CampaignMember]);
    }
}