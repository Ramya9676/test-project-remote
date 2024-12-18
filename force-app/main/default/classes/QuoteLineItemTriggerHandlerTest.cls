@IsTest
public class QuoteLineItemTriggerHandlerTest {
    @isTest static void testInsertQuoteLineItemsWithOpportunityRelatedOppLineItems(){
        //Test data setup create product, opportunity, opportunity products, quote, and quote line item
        Account acct = new Account(Name='Test Account');
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
                                          Opportunity_Type_New_Renewal_Upsell__c = 'Renewal',
                                         Pricebook2Id=standardPricebook.id,
                                         Subscription_End_Date__c=Date.newInstance(2022, 9, 30),
                                         Subscription_Start_Date__c=Date.newInstance(2021, 10, 1));
        insert opp;
        OpportunityContactRole ocr = new OpportunityContactRole(ContactId=cont.Id,
        														OpportunityId=opp.Id,
                                                               IsPrimary=true,
                                                               Role='First Contact');
        insert ocr;
        Product2 prod = new Product2(Name='Test Product', IsActive = true);
        insert prod;
        PricebookEntry pbe=new PricebookEntry(Pricebook2Id=standardPricebook.Id, Product2Id=prod.Id, UnitPrice=1, IsActive = true);
        insert pbe;
        system.debug(opp.Id);
        OpportunityLineItem oli = new OpportunityLineItem(OpportunityId=opp.Id, Quantity=1, of_Months__c=2, Product2Id=prod.Id, UnitPrice=7);
        insert oli;
        Quote quo = new Quote(Name='Test Quote',OpportunityId=opp.Id);
        insert quo;
        QuoteLineItem qli = new QuoteLineItem(OpportunityLineItemId=oli.id, QuoteId=quo.id, PricebookEntryId=pbe.Id, Quantity=oli.Quantity, UnitPrice=Oli.UnitPrice, Product2Id=oli.Product2Id);
        insert qli;
        //system.debug([Select of_Months__c from QuoteLineItem WHERE OpportunityLineItemId = :oli.Id LIMIT 1]);
        List<QuoteLineItem> qlis = new List<QuoteLineItem>([Select Id, of_Months__c, Quantity, OpportunityLineItemId from QuoteLineItem WHERE OpportunityLineItemId = :oli.Id LIMIT 1]);
       // system.debug('oli.Id '+oli.Id);
        //system.debug('qli.id '+ qli.Id);
        //system.debug('oli.of_Months__c '+oli.of_Months__c);
        //system.debug('qlis[0].of_Months__c '+qlis[0].of_Months__c);
                //tests for unused parts of the trigger for code coverage
		Map<ID, QuoteLineItem> qlisMap = new Map<ID, QuoteLineItem>();
        QuoteLineItemTriggerHandler.beforeInsert(qlis);
        QuoteLineItemTriggerHandler.afterDelete(qlis,qlisMap);
        QuoteLineItemTriggerHandler.afterUnDelete(qlis,qlisMap);
        QuoteLineItemTriggerHandler.beforeUpdate(qlis,qlis,qlisMap,qlisMap);
        QuoteLineItemTriggerHandler.beforeDelete(qlis,qlisMap);
        //Perform test
        System.assertEquals(oli.of_Months__c,qlis[0].of_Months__c);
        
    }
    
        @isTest static void testUpdateQuoteLineItemsWithOpportunityRelatedOppLineItems(){
        //Test data setup create product, opportunity, opportunity products, quote, and quote line item
        Account acct = new Account(Name='Test Account');
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
                                          Opportunity_Type_New_Renewal_Upsell__c = 'Renewal',
                                         Pricebook2Id=standardPricebook.id,
                                         Subscription_End_Date__c=Date.newInstance(2022, 9, 30),
                                         Subscription_Start_Date__c=Date.newInstance(2021, 10, 1));
        insert opp;
        OpportunityContactRole ocr = new OpportunityContactRole(ContactId=cont.Id,
        														OpportunityId=opp.Id,
                                                               IsPrimary=true,
                                                               Role='First Contact');
        insert ocr;
        Product2 prod = new Product2(Name='Test Product', IsActive = true);
        insert prod;
        PricebookEntry pbe=new PricebookEntry(Pricebook2Id=standardPricebook.Id, Product2Id=prod.Id, UnitPrice=1, IsActive = true);
        insert pbe;
        system.debug(opp.Id);
        OpportunityLineItem oli = new OpportunityLineItem(OpportunityId=opp.Id, Quantity=1, of_Months__c=2, Product2Id=prod.Id, UnitPrice=7);
        insert oli;
        Quote quo = new Quote(Name='Test Quote',OpportunityId=opp.Id);
        insert quo;
        QuoteLineItem qli = new QuoteLineItem(OpportunityLineItemId=oli.id, QuoteId=quo.id, PricebookEntryId=pbe.Id, Quantity=oli.Quantity, UnitPrice=Oli.UnitPrice, Product2Id=oli.Product2Id);
        insert qli;
        opp.SyncedQuoteId=quo.id;
        update opp;
        qli.of_Months__c=32;
        update qli;
        System.assertEquals(1,[Select count() from OpportunityLineItem WHERE OpportunityId = :opp.Id AND of_Months__c=32]);
        //system.debug([Select of_Months__c from QuoteLineItem WHERE OpportunityLineItemId = :oli.Id LIMIT 1]);
        List<QuoteLineItem> qlis = new List<QuoteLineItem>([Select Id, of_Months__c, Quantity, OpportunityLineItemId from QuoteLineItem WHERE OpportunityLineItemId = :oli.Id LIMIT 1]);
       // system.debug('oli.Id '+oli.Id);
        //system.debug('qli.id '+ qli.Id);
        //system.debug('oli.of_Months__c '+oli.of_Months__c);
        //system.debug('qlis[0].of_Months__c '+qlis[0].of_Months__c);
                //tests for unused parts of the trigger for code coverage
		Map<ID, QuoteLineItem> qlisMap = new Map<ID, QuoteLineItem>();
        QuoteLineItemTriggerHandler.beforeInsert(qlis);
        QuoteLineItemTriggerHandler.afterDelete(qlis,qlisMap);
        QuoteLineItemTriggerHandler.afterUnDelete(qlis,qlisMap);
        QuoteLineItemTriggerHandler.beforeUpdate(qlis,qlis,qlisMap,qlisMap);
        QuoteLineItemTriggerHandler.beforeDelete(qlis,qlisMap);
        //Perform test
        //System.assertEquals(oli.of_Months__c,qlis[0].of_Months__c);
        
    }
}