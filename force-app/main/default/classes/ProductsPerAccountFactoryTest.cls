@IsTest
public class ProductsPerAccountFactoryTest {
    @isTest static void testProductsPerAccountFactory(){
        //Test data setup create product, opportunity, opportunity products
        Account acct = new Account(Name='Test Account');
        insert acct;
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
        Product2 prod = new Product2(Name='Test Product');
        insert prod;
        PricebookEntry pbe=new PricebookEntry(Pricebook2Id=standardPricebook.Id, Product2Id=prod.Id, UnitPrice=1, IsActive = true);
        insert pbe;
        system.debug(opp.Id);
        OpportunityLineItem oli = new OpportunityLineItem(OpportunityId=opp.Id, Quantity=1, of_Months__c=2, Product2Id=prod.Id, UnitPrice=7);
        insert oli;
        //run test
        ProductsPerAccountFactory ppaf1 = new ProductsPerAccountFactory();
        	ppaf1.AcctId=acct.id;
        	ppaf1.DateToCheck=opp.Subscription_Start_Date__c;
        ppaf1.getProductsPerAccount();
    }
}