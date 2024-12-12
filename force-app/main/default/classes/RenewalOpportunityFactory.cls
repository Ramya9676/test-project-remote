public class RenewalOpportunityFactory {
    public static void createRenewalOpp(List<Opportunity> oldOpp){
        Opportunity renewalOpp = oldOpp[0].clone(false,false,false,false);
        renewalOpp.Subscription_Start_Date__c=renewalOpp.Subscription_End_Date__c.addDays(1);
        renewalOpp.Subscription_End_Date__c=renewalOpp.Subscription_End_Date__c.addYears(1);
        renewalOpp.CloseDate=oldOpp[0].Subscription_End_Date__c;
        renewalOpp.StageName='Qualify';
        renewalOpp.Probability=15;
        renewalOpp.Previous_Opportunity__c=oldOpp[0].Id;
        renewalOpp.Opportunity_Type_New_Renewal_Upsell__c='Renewal';
        renewalOpp.of_Months_for_Subs_Activation__c='12';
        renewalOpp.Invoice_Number__c=null;
        renewalOpp.Subs_Activation_Email_Sent__c=null;
        renewalOpp.Name = renewalOpp.Account.Name + ' Renewal ' + renewalOpp.Subscription_Start_Date__c.format();
        renewalOpp.ContactId=oldOpp[0].ContactId;
        insert renewalOpp; 
        
                List<OpportunityContactRole> oldOCRs = new List<OpportunityContactRole>([SELECT ContactId,CreatedById,CreatedDate,CurrencyIsoCode,Id,IsDeleted,IsPrimary,LastModifiedById,LastModifiedDate,OpportunityId,Role,SystemModstamp FROM OpportunityContactRole
WHERE OpportunityId=:oldOpp[0].Id AND IsDeleted=false
]);
         List<OpportunityContactRole> ocrToInsert = new List<OpportunityContactRole>();
        for(OpportunityContactRole o : oldOCRs){
            OpportunityContactRole newOCR = o.clone(false,false,false,false);
            newOCR.OpportunityId=renewalOpp.Id;
            ocrToInsert.add(newOCR);
            //insert newOCR;
        }
        insert ocrToInsert;
        
        List<OpportunityLineItem> oldOLIs = new List<OpportunityLineItem>([SELECT Annual_Revenue__c,AutorabitExtId__c,CreatedById,CreatedDate,CurrencyIsoCode,Description,Discount,Discount_Given__c,Id,IsDeleted,Is_this_PS__c,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Name,of_Months__c,OpportunityId,PricebookEntryId,Product2Id,ProductCode,ProductFamily__c,Quantity,Recurring_Revenue__c,ServiceDate,SortOrder,Subtotal,SystemModstamp,UnitPrice FROM OpportunityLineItem
WHERE OpportunityId=:oldOpp[0].Id AND PricebookEntry.IsActive=true
and Recurring_Revenue__c=true and Product2Id != '01t0K000006lGeHQAU' AND PRODUCT2.Family != 'Professional Services - Restricted']);
        List<OpportunityLineItem> oliToInsert = new List<OpportunityLineItem>();
        for(OpportunityLineItem o : oldOLIs){
            OpportunityLineItem newOLI = o.clone(false,false,false,false);
            newOLI.OpportunityId=renewalOpp.Id;
            newOLI.UnitPrice=newOLI.UnitPrice*1.05;
            newOLI.of_Months__c=12;
            oliToInsert.add(newOLI);
            //insert newOLI;
        }
        insert oliToInsert; 
        
    }
}