@IsTest
public class schedAccountCurrentMetricsDailyTest {
	@testSetup
  	static void setup() {
        //Test data setup create product, opportunity, opportunity products
        Account acct = new Account(Name='Test Account3');
        insert acct;
        Contact cont = new Contact(LastName='Contact',
                                   FirstName='Test',
                                  AccountId=acct.Id);
        insert cont;
        Pricebook2 standardPricebook = new Pricebook2(Id = Test.getStandardPricebookId(),IsActive = true);
        update standardPricebook;
        Opportunity opp = new Opportunity(Name=acct.Name + ' Opportunity',
                                          StageName='Qualify',
                                          CloseDate=System.today(),
                                          AccountId=acct.Id,
                                          Opportunity_Type_New_Renewal_Upsell__c = 'New Logo',
                                         Pricebook2Id=standardPricebook.id,
                                         Subscription_End_Date__c=DATE.TODAY().addmonths(12).toStartOfMonth().adddays(-1),
                                         Subscription_Start_Date__c=DATE.TODAY(), 
                                         of_Months_for_Subs_Activation__c='12',
                                         ContactId=cont.Id);
        insert opp;
        OpportunityContactRole ocr = new OpportunityContactRole(ContactId=cont.Id,
        														OpportunityId=opp.Id,
                                                               IsPrimary=true,
                                                               Role='First Contact');
        insert ocr;
        OpportunityContactRole ocrTech = new OpportunityContactRole(ContactId=cont.Id,
        														OpportunityId=opp.Id,
                                                               IsPrimary=true,
                                                               Role='Technical Contact');
        insert ocrTech;
        OpportunityContactRole ocrBusiness = new OpportunityContactRole(ContactId=cont.Id,
        														OpportunityId=opp.Id,
                                                               IsPrimary=true,
                                                               Role='Business Contact');
        insert ocrBusiness;
        Product2 prod = new Product2(Name='Test Product', Product_Type__c='Recurring');
        insert prod;
        PricebookEntry pbe=new PricebookEntry(Pricebook2Id=standardPricebook.Id, Product2Id=prod.Id, UnitPrice=1, IsActive = true);
        insert pbe;        
    	system.debug(opp.Id);
        OpportunityLineItem oli = new OpportunityLineItem(OpportunityId=opp.Id, Quantity=1, of_Months__c=12, Product2Id=prod.Id, UnitPrice=10);
        OpportunityLineItem oli1 = new OpportunityLineItem(OpportunityId=opp.Id, Quantity=1, of_Months__c=12, Product2Id=prod.Id, UnitPrice=10, Accounting_Bin_Override__c='CodeScan');
        OpportunityLineItem oli2 = new OpportunityLineItem(OpportunityId=opp.Id, Quantity=1, of_Months__c=12, Product2Id=prod.Id, UnitPrice=10, Accounting_Bin_Override__c='Record Migrator');
        OpportunityLineItem oli3 = new OpportunityLineItem(OpportunityId=opp.Id, Quantity=1, of_Months__c=12, Product2Id=prod.Id, UnitPrice=10, Accounting_Bin_Override__c='Support');
        OpportunityLineItem oli4 = new OpportunityLineItem(OpportunityId=opp.Id, Quantity=1, of_Months__c=12, Product2Id=prod.Id, UnitPrice=10, Accounting_Bin_Override__c='Vault');
        insert oli;
        insert oli1;
        insert oli2;
        insert oli3;
        insert oli4;
        List<Opportunity> oppToWon = [SELECT Id, StageName from Opportunity where Name = 'Test Account3 Opportunity' LIMIT 1];
        oppToWon[0].StageName = 'Closed Won';
        Update oppToWon;
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
            new schedAccountCurrentMetricsDaily());
        // Stopping the test will run the job synchronously
        Test.stopTest();
        // Now that the scheduled job has executed,
        // check that Parent_of_Customer__c has been changed to false
        System.assertEquals(1,[SELECT Count() from Account where ARR_End_of_Month__c=600]);
    }
       
}