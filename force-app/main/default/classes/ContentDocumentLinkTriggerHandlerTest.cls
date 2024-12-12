@IsTest
public class ContentDocumentLinkTriggerHandlerTest {
	@isTest static void testInsertContentDocumentWithOrderInFileName(){
        //Test data setup create Account, Opportunity, ContentDocument
        Account acct = new Account(Name='Test Account');
        insert acct;
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
                                         NextStep='Testing',
                                         Competitors__c='None');
        insert opp;
        Blob bodyBlob=Blob.valueOf('Unit Test ContentVersion Body to be insert in test class for testing the'); 
            
            ContentVersion contentVersion_1 = new ContentVersion(
                Title='Testorder', 
                PathOnClient ='TestOrder.txt',
                VersionData = bodyBlob,
                origin = 'C'
            );
            insert contentVersion_1;
                      
            ContentDocumentLink contentlink = new ContentDocumentLink();
            contentlink.LinkedEntityId = opp.id;
            contentlink.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:contentVersion_1.Id].ContentDocumentId;
        	contentlink.ShareType = 'V';
            insert contentlink;
        	system.debug('opp.Id '+opp.Id);
        	system.debug('contentlink.ContentDocumentId '+contentlink.ContentDocumentId);
        	system.debug([SELECT Title FROM ContentVersion WHERE Id =:contentVersion_1.Id]);
        	system.debug([SELECT Title FROM ContentDocument WHERE LatestPublishedVersionId =:contentVersion_1.Id]);
        	system.debug([SELECT Order_Attached__c FROM Opportunity where Id=:contentlink.LinkedEntityId]);
        	system.debug('contentlink.LinkedEntityId '+contentlink.LinkedEntityId);
        
       		List<Opportunity> olis = new List<Opportunity>([SELECT Order_Attached__c FROM Opportunity where Id=:contentlink.LinkedEntityId LIMIT 1]);

            System.assertEquals(true,olis[0].Order_Attached__c);
    }
    	@isTest static void testInsertContentDocumentWithoutOrderInFileName(){
        //Test data setup create Account, Opportunity, ContentDocument
        Account acct = new Account(Name='Test Account');
        insert acct;
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
                                         NextStep='Testing',
                                         Competitors__c='None');
        insert opp;
        Blob bodyBlob=Blob.valueOf('Unit Test ContentVersion Body to be insert in test class for testing the'); 
            
            ContentVersion contentVersion_1 = new ContentVersion(
                Title='TestTest', 
                PathOnClient ='TestOrder.txt',
                VersionData = bodyBlob,
                origin = 'C'
            );
            insert contentVersion_1;
                      
            ContentDocumentLink contentlink = new ContentDocumentLink();
            contentlink.LinkedEntityId = opp.id;
            contentlink.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:contentVersion_1.Id].ContentDocumentId;
        	contentlink.ShareType = 'V';
            insert contentlink;
        	system.debug('opp.Id '+opp.Id);
        	system.debug('contentlink.ContentDocumentId '+contentlink.ContentDocumentId);
        	system.debug([SELECT Title FROM ContentVersion WHERE Id =:contentVersion_1.Id]);
        	system.debug([SELECT Title FROM ContentDocument WHERE LatestPublishedVersionId =:contentVersion_1.Id]);
        	system.debug([SELECT Order_Attached__c FROM Opportunity where Id=:contentlink.LinkedEntityId]);
        	system.debug('contentlink.LinkedEntityId '+contentlink.LinkedEntityId);
        
       		List<Opportunity> olis = new List<Opportunity>([SELECT Order_Attached__c FROM Opportunity where Id=:contentlink.LinkedEntityId LIMIT 1]);

            System.assertEquals(false,olis[0].Order_Attached__c);
    }
}