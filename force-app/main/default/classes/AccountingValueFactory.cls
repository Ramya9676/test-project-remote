public class AccountingValueFactory {
    public static void SetARRLastFullMonth(List<Opportunity> oppsToUpdate){
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        for(Opportunity o:oppsToUpdate){
            AggregateResult arMD = [select max(Item_End_Date__c), max(of_months__c), min(Item_Start_Date__c) from OpportunityLineItem where Recurring_Revenue__c=true and OpportunityId=:o.Id];
            Date MaxItemEndDate = (Date)arMD.get('expr0');
            Decimal MaxItemofMonths = (Decimal)arMD.get('expr1');
            Date MinItemStartDate = (Date)arMD.get('expr2');
            if(o.Subscription_Start_Date__c==null){o.Subscription_Start_Date__c = MinItemStartDate==null ? o.CloseDate + 1 : MinItemStartDate;}
            if(o.Subscription_End_Date__c==null){o.Subscription_End_Date__c = MaxItemEndDate==null ? o.CloseDate.addMonths(Integer.valueOf(String.valueof(MaxItemofMonths))) : MaxItemEndDate;}
            if(string.isBlank(o.of_Months_for_Subs_Activation__c)){o.of_Months_for_Subs_Activation__c = String.valueof(o.Subscription_Start_Date__c.monthsBetween(o.Subscription_End_Date__c));}
            if(MaxItemEndDate != null){
                MaxItemEndDate = MaxItemEndDate.toStartOfMonth();
                AggregateResult ar = [select SUM(Annual_Revenue__c), OpportunityId
                                      from OpportunityLineItem where Recurring_Revenue__c=true 
                                      and OpportunityId =:o.Id
                                      and ((Item_End_Date__c >= :MaxItemEndDate) OR (Item_Start_Date__c = null))
                                      GROUP BY OpportunityId
                                     ];  
                Decimal total = Decimal.valueOf(String.valueOf(ar.get('expr0')));
                opportunitiesToUpdate.add(new Opportunity(
                    Id = String.valueOf(ar.get('OpportunityId')),ARR_Last_Full_Month_of_Opp__c = total,
                Subscription_Start_Date__c=o.Subscription_Start_Date__c, Subscription_End_Date__c = o.Subscription_End_Date__c,
                of_Months_for_Subs_Activation__c=o.of_Months_for_Subs_Activation__c)
                                         );
            } else if (MaxItemofMonths!=null){
                AggregateResult ar = [select SUM(Annual_Revenue__c), COUNT(Id), OpportunityId
                                      from OpportunityLineItem where Recurring_Revenue__c=true 
                                      and OpportunityId =:o.Id
                                      GROUP BY OpportunityId
                                     ];
                Decimal total = 0;
                if(Decimal.valueOf(String.valueOf(ar.get('expr0')))!=null){
                           total = Decimal.valueOf(String.valueOf(ar.get('expr0')));
                }
                            opportunitiesToUpdate.add(new Opportunity(
                    Id = o.Id,ARR_Last_Full_Month_of_Opp__c = total,
                Subscription_Start_Date__c=o.Subscription_Start_Date__c, Subscription_End_Date__c = o.Subscription_End_Date__c,
                of_Months_for_Subs_Activation__c=o.of_Months_for_Subs_Activation__c)
                                         );
            }
            	else{Decimal total = 0;
                opportunitiesToUpdate.add(new Opportunity(
                    Id = o.Id,ARR_Last_Full_Month_of_Opp__c = total,
                Subscription_Start_Date__c=o.Subscription_Start_Date__c, Subscription_End_Date__c = o.Subscription_End_Date__c,
                of_Months_for_Subs_Activation__c=o.of_Months_for_Subs_Activation__c)
                                         );}
            
            
        } 
        if (!opportunitiesToUpdate.isEmpty()) {
            update opportunitiesToUpdate;
        }
    }
}