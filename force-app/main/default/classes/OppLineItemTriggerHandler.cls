public class OppLineItemTriggerHandler {
    public static void beforeInsert(List<OpportunityLineItem> newOpportunityLineItems) {
        set<Id> p1 = new set<Id>();
        for(OpportunityLineItem o2: newOpportunityLineItems){
            p1.add(o2.Product2Id);
        }
    Map<Id,Product2> relatedData = new Map<Id,Product2>(   [   SELECT  Id, Accounting_Bin__c, Product_Type__c, Family
            FROM    PRODUCT2
            WHERE   Id IN :p1
        ]
    );
        for(OpportunityLineItem o: newOpportunityLineItems){
            if(relatedData.get(o.Product2Id).Product_Type__c=='Recurring'){
                o.Recurring_Revenue__c=true;
                    }else{o.Recurring_Revenue__c=false;}
            o.ProductFamily__c=relatedData.get(o.Product2Id).Family;
            if(string.isBlank(o.Accounting_Bin_Override__c)==true){
                if(string.isBlank(relatedData.get(o.Product2Id).Accounting_Bin__c)==false){
                    o.Accounting_Bin_Override__c=relatedData.get(o.Product2Id).Accounting_Bin__c;
                }else{o.Accounting_Bin_Override__c='Subscriptions';}
            }
        }
    }
    public static void beforeUpdate(List<OpportunityLineItem> oldOpportunityLineItems, List<OpportunityLineItem> newOpportunityLineItems, Map<ID, SObject> oldOpportunityLineItemMap, Map<ID, SObject> newOpportunityLineItemMap) {
        // helper.doTask3();
        // helper.doTask4();
    }
    public static void beforeDelete(List<OpportunityLineItem> oldOpportunityLineItems, Map<ID, SObject> oldOpportunityLineItemMap) {
        // helper.doTask5();
        // helper.doTask1();
    }
    public static void afterInsert(List<OpportunityLineItem> newOpportunityLineItems, Map<ID, SObject> newOpportunityLineItemMap) {
        list<QuoteLineItem> QuoteLineItemsList = [SELECT Id, OpportunityLineItemId, of_Months__c, Is_Syncing__c FROM QuoteLineItem 
                                            where Quote.IsSyncing=true AND OpportunityLineItemId in :newOpportunityLineItems];
        
        List<QuoteLineItem> quoteLineItemsToUpdate = new List<QuoteLineItem>();
        Set<Id> opportunityIds = new Set<Id>();
        for(OpportunityLineItem o:newOpportunityLineItems){
            opportunityIds.add(o.OpportunityId); 
            for(QuoteLineItem q:QuoteLineItemsList){
                if(q.OpportunityLineItemId == o.Id && o.of_Months__c != q.of_Months__c){
                    q.Is_Syncing__c=true;
                    quoteLineItemsToUpdate.add(q);
                }
            }
        }
        // Perform DML on a collection
        if (quoteLineItemsToUpdate.size() > 0){
                update quoteLineItemsToUpdate;
        }
        List<Opportunity> opportunitiesToUpdate = [Select Id, Subscription_Start_Date__c, Subscription_End_Date__c, of_Months_for_Subs_Activation__c, CloseDate from Opportunity where Id in :opportunityIds];
        if (!opportunitiesToUpdate.isEmpty()) {
            AccountingValueFactory.SetARRLastFullMonth(opportunitiesToUpdate);
    	}
    }
    public static void afterUpdate(List<OpportunityLineItem> oldOpportunityLineItems, List<OpportunityLineItem> newOpportunityLineItems, Map<ID, SObject> oldOpportunityLineItemMap, Map<ID, SObject> newOpportunityLineItemMap) {
        list<QuoteLineItem> QuoteLineItemsList = [SELECT Id, OpportunityLineItemId, of_Months__c FROM QuoteLineItem 
                                            where Quote.IsSyncing=true AND OpportunityLineItemId in :newOpportunityLineItems];
        
        List<QuoteLineItem> quoteLineItemsToUpdate = new List<QuoteLineItem>();
        Set<Id> opportunityIds = new Set<Id>();
        for(OpportunityLineItem o:newOpportunityLineItems){
            opportunityIds.add(o.OpportunityId); 
            for(QuoteLineItem q:QuoteLineItemsList){
                if(q.OpportunityLineItemId == o.Id && o.of_Months__c != q.of_Months__c){
                    q.of_Months__c=o.of_Months__c;
                    quoteLineItemsToUpdate.add(q);
                }
            }
        }
        // Perform DML on a collection
        if (quoteLineItemsToUpdate.size() > 0){
                update quoteLineItemsToUpdate;
        }   
        List<Opportunity> opportunitiesToUpdate = [Select Id, Subscription_Start_Date__c, Subscription_End_Date__c, of_Months_for_Subs_Activation__c, CloseDate from Opportunity where Id in :opportunityIds];
        if (!opportunitiesToUpdate.isEmpty()) {
            AccountingValueFactory.SetARRLastFullMonth(opportunitiesToUpdate);
    	}
    }
    public static void afterDelete(List<OpportunityLineItem> oldOpportunityLineItems, Map<ID, SObject> oldOpportunityLineItemMap) {
        Set<Id> opportunityIds = new Set<Id>();
        for(OpportunityLineItem o:oldOpportunityLineItems){
            opportunityIds.add(o.OpportunityId); 
        }
        List<Opportunity> opportunitiesToUpdate = [Select Id, Subscription_Start_Date__c, Subscription_End_Date__c, of_Months_for_Subs_Activation__c, CloseDate from Opportunity where Id in :opportunityIds];
        if (!opportunitiesToUpdate.isEmpty()) {
            AccountingValueFactory.SetARRLastFullMonth(opportunitiesToUpdate);
    	}
    }
    public static void afterUndelete(List<OpportunityLineItem> newOpportunityLineItems, Map<ID, SObject> newOpportunityLineItemMap) {
        Set<Id> opportunityIds = new Set<Id>();
        for(OpportunityLineItem o:newOpportunityLineItems){
            opportunityIds.add(o.OpportunityId); 
        }
        List<Opportunity> opportunitiesToUpdate = [Select Id, Subscription_Start_Date__c, Subscription_End_Date__c, of_Months_for_Subs_Activation__c, CloseDate from Opportunity where Id in :opportunityIds];
        if (!opportunitiesToUpdate.isEmpty()) {
            AccountingValueFactory.SetARRLastFullMonth(opportunitiesToUpdate);
    	}
    }

}