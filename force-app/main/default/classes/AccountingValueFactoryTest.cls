@IsTest
public class AccountingValueFactoryTest {
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
                                          CloseDate=System.today().addMonths(1),
                                          AccountId=acct.Id,
                                          Opportunity_Type_New_Renewal_Upsell__c = 'New Logo',
                                         Pricebook2Id=standardPricebook.id,
                                         Subscription_End_Date__c=Date.newInstance(2022, 9, 30),
                                         Subscription_Start_Date__c=Date.newInstance(2021, 10, 1), 
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
        insert oli;
        Opportunity opp2 = new Opportunity(Name=acct.Name + ' Opportunity',
                                          StageName='Qualify',
                                          CloseDate=System.today().addMonths(1),
                                          AccountId=acct.Id,
                                          Opportunity_Type_New_Renewal_Upsell__c = 'New Logo',
                                         Pricebook2Id=standardPricebook.id,
                                         //Subscription_End_Date__c=Date.newInstance(2022, 9, 30),
                                         //Subscription_Start_Date__c=Date.newInstance(2021, 10, 1), 
                                         //of_Months_for_Subs_Activation__c='12',
                                         ContactId=cont.Id);
        insert opp2;
        OpportunityContactRole ocr2 = new OpportunityContactRole(ContactId=cont.Id,
        														OpportunityId=opp2.Id,
                                                               IsPrimary=true,
                                                               Role='First Contact');
        insert ocr2;
        OpportunityContactRole ocrTech2 = new OpportunityContactRole(ContactId=cont.Id,
        														OpportunityId=opp2.Id,
                                                               IsPrimary=true,
                                                               Role='Technical Contact');
        insert ocrTech2;
        OpportunityContactRole ocrBusiness2 = new OpportunityContactRole(ContactId=cont.Id,
        														OpportunityId=opp2.Id,
                                                               IsPrimary=true,
                                                               Role='Business Contact');
        insert ocrBusiness2;
        OpportunityLineItem oli2 = new OpportunityLineItem(OpportunityId=opp2.Id, Quantity=1, of_Months__c=12, Product2Id=prod.Id, UnitPrice=10);
        insert oli2;
    }
    @IsTest static void SetARRLastFullMonthTest(){
        List<Opportunity> opportunitiesToUpdate = [SELECT ID, Subscription_Start_Date__c, Subscription_End_Date__c, CloseDate, of_Months_for_Subs_Activation__c FROM OPPORTUNITY];
        Test.startTest();
    	AccountingValueFactory.SetARRLastFullMonth(opportunitiesToUpdate);
    	Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(2, [select count() from Opportunity where ARR_Last_Full_Month_of_Opp__c  = 120]);
    }
}