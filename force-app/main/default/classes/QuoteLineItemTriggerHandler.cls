public class QuoteLineItemTriggerHandler {
    public static void beforeInsert(List<QuoteLineItem> newQuoteLineItems) {
        Set<Id> OLI = new Set<Id>();
        for ( QuoteLineItem a:newQuoteLineItems)
        {
            if(a.OpportunityLineItemId!=NULL)
            {
                OLI.add(a.OpportunityLineItemId);
            }
        }
        
        if(!OLI.isEmpty()){
            Map<Id,OpportunityLineItem> oliMonthsMap = new Map<Id,OpportunityLineItem>([Select Id, of_Months__c from OpportunityLineItem where Id IN :OLI]);
        
            for(QuoteLineItem a:newQuoteLineItems){
                if(a.OpportunityLineItemId!=NULL){
                    a.of_Months__c=oliMonthsMap.get(a.OpportunityLineItemId).of_Months__c;
            	}
        	}
        } 
    }
    public static void beforeUpdate(List<QuoteLineItem> oldQuoteLineItems, List<QuoteLineItem> newQuoteLineItems, Map<ID, SObject> oldQuoteLineItemMap, Map<ID, SObject> newQuoteLineItemMap) {
        // helper.doTask3();
        // helper.doTask4();
    }
    public static void beforeDelete(List<QuoteLineItem> oldQuoteLineItems, Map<ID, SObject> oldQuoteLineItemMap) {
        // helper.doTask5();
        // helper.doTask1();
    }
    public static void afterInsert(List<QuoteLineItem> newQuoteLineItems, Map<ID, SObject> newQuoteLineItemMap) {
        list<OpportunityLineItem> OpportunityLineItemsList = [SELECT Id, of_Months__c FROM OpportunityLineItem 
                                            where Opportunity.SyncedQuoteId!=NULL AND Id in (SELECT OpportunityLineItemId FROM QuoteLineItem where Quote.IsSyncing=true AND id in :newQuoteLineItems)];
        
        List<OpportunityLineItem> opportunityLineItemsToUpdate = new List<OpportunityLineItem>();
        for(QuoteLineItem q:newQuoteLineItems){
            for(OpportunityLineItem o:OpportunityLineItemsList){
                if(q.OpportunityLineItemId == o.Id && o.of_Months__c != q.of_Months__c){
                    o.of_Months__c=q.of_Months__c;
                    opportunityLineItemsToUpdate.add(o);
                }
            }
        }
        // Perform DML on a collection
        if (opportunityLineItemsToUpdate.size() > 0){
                update opportunityLineItemsToUpdate;
        }   
    }
    public static void afterUpdate(List<QuoteLineItem> oldQuoteLineItems, List<QuoteLineItem> newQuoteLineItems, Map<ID, SObject> oldQuoteLineItemMap, Map<ID, SObject> newQuoteLineItemMap) {
        list<OpportunityLineItem> OpportunityLineItemsList = [SELECT Id, of_Months__c FROM OpportunityLineItem 
                                            where Opportunity.SyncedQuoteId!=NULL AND Id in (SELECT OpportunityLineItemId FROM QuoteLineItem where Quote.IsSyncing=true AND id in :newQuoteLineItems)];
        
        List<OpportunityLineItem> opportunityLineItemsToUpdate = new List<OpportunityLineItem>();
        for(QuoteLineItem q:newQuoteLineItems){
            for(OpportunityLineItem o:OpportunityLineItemsList){
                if(q.OpportunityLineItemId == o.Id && o.of_Months__c != q.of_Months__c){
                            system.debug('o.of_Months__c '+o.of_Months__c);
        system.debug('q.of_Months__c '+q.of_Months__c);
        system.debug('q.OpportunityLineItemId ' + q.OpportunityLineItemId);
        system.debug('o.Id ' + o.Id);
                    o.of_Months__c=q.of_Months__c;
                    opportunityLineItemsToUpdate.add(o);
                }
            }
        }
        // Perform DML on a collection
        if (opportunityLineItemsToUpdate.size() > 0){
                update opportunityLineItemsToUpdate;
        }   
    }
    public static void afterDelete(List<QuoteLineItem> oldQuoteLineItems, Map<ID, SObject> oldQuoteLineItemMap) {
        // helper.doTask3();
        // helper.doTask1();
    }
    public static void afterUndelete(List<QuoteLineItem> newQuoteLineItems, Map<ID, SObject> newQuoteLineItemMap) {
        // helper.doTask4();
        // helper.doTask2();
    }    
}