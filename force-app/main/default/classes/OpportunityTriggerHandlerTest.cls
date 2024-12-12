@IsTest
public class OpportunityTriggerHandlerTest {
	@isTest (SeeAllData=false) static void testUpdateOpportunityToClosedWon(){
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
        //system.debug([Select of_Months__c from QuoteLineItem WHERE OpportunityLineItemId = :oli.Id LIMIT 1]);
        Test.startTest();
        Opportunity oppsToUpdate = [SELECT Id, of_Months__c, StageName, Opportunity_ARR_Amount__c,Subs_Activation_Email_Sent__c  from Opportunity where Name='Test Account3 Opportunity' LIMIT 1];
        system.debug('oppsToUpdate.of_Months__c '+oppsToUpdate.of_Months__c);
        system.debug('oppsToUpdate.StageName '+oppsToUpdate.StageName);
        system.debug('oppsToUpdate.Opportunity_ARR_Amount__c ' + oppsToUpdate.Opportunity_ARR_Amount__c);
        system.debug('oppsToUpdate.Subs_Activation_Email_Sent__c ' + oppsToUpdate.Subs_Activation_Email_Sent__c);
        oppsToUpdate.StageName='Closed Won';
        opp.StageName='Closed Won';
        update oppsToUpdate;
        update opp;
       // system.debug('oli.Id '+oli.Id);
        //system.debug('qli.id '+ qli.Id);
        system.debug('oppsToUpdate.of_Months__c '+oppsToUpdate.of_Months__c);
        system.debug('oppsToUpdate.StageName '+oppsToUpdate.StageName);
        system.debug('oppsToUpdate.Opportunity_ARR_Amount__c ' + oppsToUpdate.Opportunity_ARR_Amount__c);
        system.debug('oppsToUpdate.Subs_Activation_Email_Sent__c ' + oppsToUpdate.Subs_Activation_Email_Sent__c);
        //Perform test
        //List<Opportunity> renewalOpp = [SELECT count() FROM Opportunity WHERE StageName='Qualify'];
        //system.debug('renewalOpp[0].Id '+ renewalOpp[0].Id);
        //System.assertEquals(1,[SELECT count() FROM Opportunity WHERE Name='Test Account Renewal 10/1/2022 to 9/30/2023']);
        Test.stopTest();
        System.assertEquals(1,[SELECT count() FROM Opportunity WHERE StageName='Qualify']);
        //Test.stopTest();
    }
}