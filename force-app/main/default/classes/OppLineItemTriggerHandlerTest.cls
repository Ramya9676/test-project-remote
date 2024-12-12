@IsTest
public class OppLineItemTriggerHandlerTest {
    	@testSetup
  		static void setup() {
        Account acct = new Account(Name='Test Account',BillingCountry='Canada');
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
        Product2 prod = new Product2(Name='Test Product', IsActive = true, Product_Type__c='Recurring');
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
        }
    
    @isTest static void testInsertOppLineItemsWithOpportunityRelatedQuoteLineItems(){
        //Perform test
        //Test That QLI made from OLI gets the same #_of_Months__c this tests the before instert on QuoteLineItemTrigger
        System.assertEquals(1,[SELECT COUNT() FROM QuoteLineItem where of_Months__c=2]);
        //Set up data to check quote after sync
		List<Opportunity> opp10 = new List<Opportunity> ([SELECT Id, SyncedQuoteId from Opportunity]);
        List<Quote> quo10 = new List<Quote> ([Select Id, Name from Quote]);
        opp10[0].SyncedQuoteId = quo10[0].Id;
        update opp10;
        List<QuoteLineItem> qli10 = new List<QuoteLineItem> ([SELECT Id, of_Months__c from QuoteLineItem LIMIT 1]);
        qli10[0].of_Months__c=32;
        update qli10;
        System.assertEquals(1,[Select count() from OpportunityLineItem WHERE of_Months__c=32]);  
    }
        @isTest static void testInsertOppLineItemsWithOutOpportunityRelatedQuoteLineItems(){
        List<Opportunity> oppList2 = new List<Opportunity>([SELECT Id, Name, Subscription_Start_Date__c, Subscription_End_Date__c, 
                                                            of_Months_for_Subs_Activation__c, ContactId, CloseDate, Pricebook2Id  from Opportunity where Name='Test Account Opportunity']);
		Opportunity opp2 = oppList2[0].clone(false,false,false,false);
        opp2.Name='Test Opp2';
        opp2.StageName='Qualify';
        opp2.Probability=15;
        opp2.Opportunity_Type_New_Renewal_Upsell__c='Renewal';
        opp2.ContactId=oppList2[0].ContactId;
        insert opp2;
        List<OpportunityLineItem> oliList2 = new List<OpportunityLineItem> ([Select Id, OpportunityId, Product2Id from OpportunityLineItem where Opportunity.Name='Test Account Opportunity']);
        OpportunityLineItem oli2 = new OpportunityLineItem(OpportunityId=opp2.Id, Quantity=1, of_Months__c=12, Product2Id=oliList2[0].Product2Id, UnitPrice=10);
        insert oli2;
        Quote quo2 = new Quote(Name='Test Quote2',OpportunityId=opp2.Id);
        insert quo2;
        List<PricebookEntry> pbe2 = new List<PriceBookEntry>([Select Id from PricebookEntry Limit 1]);
        QuoteLineItem qli2 = new QuoteLineItem(OpportunityLineItemId=oli2.id, QuoteId=quo2.id, PricebookEntryId=pbe2[0].Id, Quantity=oli2.Quantity, UnitPrice=oli2.UnitPrice, Product2Id=oli2.Product2Id);
        insert qli2;
        qli2.of_Months__c=22;
        update qli2;
        System.assertEquals(1,[Select count() from OpportunityLineItem WHERE of_Months__c=2]);
        }
    
@isTest static void testDeleteOppLineItems(){
        //Test data setup create product, opportunity, opportunity products, quote, and quote line item
        Account acct3 = new Account(Name='Test Account3 isDifferent',BillingCountry='Japan');
        insert acct3;
        Contact cont3 = new Contact(LastName='Contact',
                                   FirstName='Test',
                                  AccountId=acct3.Id);
        insert cont3;
        Pricebook2 standardPricebook3 = new Pricebook2(Id = Test.getStandardPricebookId(),IsActive = true);
        update standardPricebook3;
        Opportunity opp3 = new Opportunity(Name=acct3.Name + ' Opportunity',
                                          StageName='Qualify',
                                          CloseDate=System.today().addMonths(1),
                                          AccountId=acct3.Id,
                                          Opportunity_Type_New_Renewal_Upsell__c = 'Renewal',
                                         Pricebook2Id=standardPricebook3.id,
                                         Subscription_End_Date__c=Date.newInstance(2022, 9, 30),
                                         Subscription_Start_Date__c=Date.newInstance(2021, 10, 1),
                                         of_Months_for_Subs_Activation__c='12',
                                         ContactId=cont3.Id);
        insert opp3;
        OpportunityContactRole ocr3 = new OpportunityContactRole(ContactId=cont3.Id,
        														OpportunityId=opp3.Id,
                                                               IsPrimary=true,
                                                               Role='First Contact');
        insert ocr3;
        OpportunityContactRole ocrTech3 = new OpportunityContactRole(ContactId=cont3.Id,
        														OpportunityId=opp3.Id,
                                                               IsPrimary=true,
                                                               Role='Technical Contact');
        insert ocrTech3;
        OpportunityContactRole ocrBusiness3 = new OpportunityContactRole(ContactId=cont3.Id,
        														OpportunityId=opp3.Id,
                                                               IsPrimary=true,
                                                               Role='Business Contact');
        insert ocrBusiness3;
        Product2 prod3 = new Product2(Name='Test Product3', IsActive = true, Product_Type__c='Recurring');
        insert prod3;
        PricebookEntry pbe3=new PricebookEntry(Pricebook2Id=standardPricebook3.Id, Product2Id=prod3.Id, UnitPrice=1, IsActive = true);
        insert pbe3;
        system.debug(opp3.Id);
        OpportunityLineItem oli3 = new OpportunityLineItem(OpportunityId=opp3.Id, Quantity=1, of_Months__c=12, Product2Id=prod3.Id, UnitPrice=10);
        insert oli3;
        system.debug('oli3.UnitPrice '+oli3.UnitPrice);
    	system.debug('opp3.ARR_Last_Full_Month_of_Opp__c '+opp3.ARR_Last_Full_Month_of_Opp__c);
    	System.assertEquals(1,[SELECT count() FROM Opportunity WHERE ARR_Last_Full_Month_of_Opp__c=120]);
    	List<OpportunityLineItem> oli4 = new List<OpportunityLineItem>([Select of_Months__c from OpportunityLineItem LIMIT 1]);
    	delete oli4[0];
    	// COMMENTED OUT BECAUSE CANNOT UNDELETE OPPORTUNITY LINE ITEMS undelete oli4[0];
    	update opp3;
        system.debug('opp3.ARR_Last_Full_Month_of_Opp__c '+opp3.ARR_Last_Full_Month_of_Opp__c);
    	//List<OpportunityLineItem> oli5 = new List<OpportunityLineItem>([Select of_Months__c from OpportunityLineItem WHERE ISDELETED=true LIMIT 1]);
    	//undelete oli5;
    	//System.assertEquals(0,[SELECT count() FROM Opportunity WHERE ARR_Last_Full_Month_of_Opp__c=120]);
        //System.assertEquals(opp.ARR_Last_Full_Month_of_Opp__c,120);
        //Quote quo = new Quote(Name='Test Quote',OpportunityId=opp.Id);
        //insert quo;
        //QuoteLineItem qli = new QuoteLineItem(OpportunityLineItemId=oli.id, QuoteId=quo.id, PricebookEntryId=pbe.Id, Quantity=oli.Quantity, UnitPrice=Oli.UnitPrice, Product2Id=oli.Product2Id);
        //insert qli;
        //opp.SyncedQuoteId=quo.id;
        //update opp;
        //system.debug([Select of_Months__c from QuoteLineItem WHERE OpportunityLineItemId = :oli.Id LIMIT 1]);
        //List<QuoteLineItem> qlis = new List<QuoteLineItem>([Select of_Months__c from QuoteLineItem WHERE OpportunityLineItemId = :oli.Id LIMIT 1]);
       // system.debug('oli.Id '+oli.Id);
        //system.debug('qli.id '+ qli.Id);
        //system.debug('opp.ARR_Last_Full_Month_of_Opp__c '+opp.ARR_Last_Full_Month_of_Opp__c);
        //system.debug('qlis[0].of_Months__c '+qlis[0].of_Months__c);
        //Perform test
        //Test That QLI made from OLI gets the same #_of_Months__c this tests the before instert on QuoteLineItemTrigger
        //System.assertEquals(oli.of_Months__c,qlis[0].of_Months__c);
        //Set up data to check quote after sync
        //qli.of_Months__c=22;
        //update qli;
        //opp.SyncedQuoteId=quo.id;
        //update opp;
        //qli.of_Months__c=32;
        //update qli;
        OpportunityLineItem oli6 = new OpportunityLineItem(OpportunityId=opp3.Id, Quantity=1, of_Months__c=12, Product2Id=prod3.Id, UnitPrice=10);
        insert oli6;
        List<OpportunityLineItem> Olis = new List<OpportunityLineItem>([Select of_Months__c, OpportunityId, Accounting_Bin_Override__c, Product2Id from OpportunityLineItem LIMIT 1]);
        Map<ID, OpportunityLineItem> OlisMap = new Map<ID, OpportunityLineItem>();
        List<OpportunityLineItem> Olis7 = new List<OpportunityLineItem>();
        Map<ID, OpportunityLineItem> OlisMap7 = new Map<ID, OpportunityLineItem>();
        //System.assertEquals(1,[Select count() from OpportunityLineItem WHERE OpportunityId = :opp.Id AND of_Months__c=32]);
        
        //tests for unused parts of the trigger for code coverage
        OppLineItemTriggerHandler.beforeInsert(Olis);
        OppLineItemTriggerHandler.afterDelete(Olis,OlisMap);
        OppLineItemTriggerHandler.afterUnDelete(Olis,OlisMap);
        OppLineItemTriggerHandler.beforeUpdate(Olis,Olis,OlisMap,OlisMap);
        OppLineItemTriggerHandler.beforeDelete(Olis,OlisMap);
    	OppLineItemTriggerHandler.afterUpdate(Olis,Olis,OlisMap,OlisMap);
        OppLineItemTriggerHandler.afterInsert(Olis,OlisMap);

        OppLineItemTriggerHandler.afterDelete(Olis7,OlisMap7);
        OppLineItemTriggerHandler.afterUnDelete(Olis7,OlisMap7);
        OppLineItemTriggerHandler.afterUpdate(Olis7,Olis7,OlisMap7,OlisMap7);
        OppLineItemTriggerHandler.afterInsert(Olis7,OlisMap7);

        
        //Test update with same # of months on oli and qli
        //opp.ARR_Last_Full_Month_of_Opp__c=3;
              
            
    }
}