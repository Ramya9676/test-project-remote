public class OpportunityTriggerHandler {
    //public static void beforeInsert(List<Opportunity> newOpportunitys) {
        // helper.doTask1();
        // helper.doTask2();
    //}
   //public static void beforeUpdate(List<Opportunity> oldOpportunitys, List<Opportunity> newOpportunitys, Map<ID, Opportunity> oldOpportunityMap, Map<ID, Opportunity> newOpportunityMap) {
    	
    //}
    //public static void beforeDelete(List<Opportunity> oldOpportunitys, Map<ID, Opportunity> oldOpportunityMap) {
        // helper.doTask5();
        // helper.doTask1();
    //}
    //public static void afterInsert(List<Opportunity> newOpportunitys, Map<ID, Opportunity> newOpportunityMap) {
    //} 
    public static void afterUpdate(List<Opportunity> oldOpportunitys, List<Opportunity> newOpportunitys, Map<ID, Opportunity> oldOpportunityMap, Map<ID, Opportunity> newOpportunityMap) {
        Set<Id> updatedOpps = new Set<Id>();
        List<Won_Opportunity_Checklist__c> insWOCList = new List<Won_Opportunity_Checklist__c>();
        for ( Opportunity a : newOpportunitys)
        {
            if(a.StageName=='Closed Won' 
               && oldOpportunityMap.get(a.Id).StageName!='Closed Won' 
               && a.Subs_Activation_Email_Sent__c==null 
               ) //Need to handle if updating closed won but renewal opp was not specifically a change to Closed Won. Aka updating already won opp
            {
                if(oldOpportunityMap.get(a.Id).Opportunity_ARR_Amount__c !=0){
                    updatedOpps.add(a.Id);
                }
                Won_Opportunity_Checklist__c insWOC = new Won_Opportunity_Checklist__c();
                insWOC.Opportunity__c=a.Id;
                insWOCList.add(insWOC);
            }
        }
        
        if(!insWOCList.isEmpty()){
            insert insWOCList;
        }
        
        if(!updatedOpps.isEmpty()){
            RenewalOpportunityFactory.createRenewalOpp([Select AccountId,Activation_Date__c,Activation_End_Date__c,
            Active_Oppty__c,Additional_Info__c,Additional_Partners__c,Address_Info__c,Age_del__c,
            ALM__c,Amount,Any_commitments_from_AR__c,AR_Implementation_Engineer__c,AutorabitExtId__c,Billing_Country__c,
            Budget_Confirmed__c,Business_Type__c,CampaignId,casesafeid__c,Churn_Subs__c,
            CloseDate,Closed_Lost_Reason__c,Close_Month__c,Company_URL__c,Competitors__c,ContactId,Contact_Email__c,Contact_Name__c,
            Contact_Phone__c,ContractId,Contract_End_Date_custom__c,Contract_End_Date__c,Contract_Period__c,Contract_Start_Date_custom__c,
            Contract_Start_Date__c,Contract_Type__c,Conversion_Time__c,CreatedById,CreatedDate,Created_Date1__c,Created_Month_as_Date__c,
            Created_Month__c,CS_Comments__c,CurrencyIsoCode,Current_Subscriptions__c,Current_Subs__c,Current_Work__c,Customer_Group__c,
            Customer_Onboarding__c,Customer_Type_Active_Churn__c,Custom_Close_date__c,Cycle_Time_DC_Close_in_Days__c,Cycle_Time__c,
            Data_Quality_Description__c,Data_Quality_Score__c,days_in_Playground__c,
            Description,
            Direct_Sales_NewLogo_Upsell_ACV_Amount__c,Discount__c,Discovery_Completed__c,Downsell_Subs__c,Evaluation_End_Date__c,Evaluation_Start_Date__c,ExpectedRevenue,Fiscal,FiscalQuarter,FiscalYear,ForecastCategory,
            ForecastCategoryName,HasOpenActivity,HasOpportunityLineItem,HasOverdueTask,HelperCheckbox__c,
            Hosting_Type__c,Hours_Spent_This_Week__c,Hours_Spent__c,Id,ID__c,Implementation_Closed_Date__c,Implementation_Complete__c,
            Implementation_End_Date__c,Implementation_Engineer__c,Implementation_Start_Date__c,Implementation_Type__c,Invoice_Date__c,Invoice_Number__c,IsClosed,
            IsDeleted,isFromOpportunity__c,isNew__c,IsPrivate,isRenewal__c,IsSplit,isStageChanged__c,isUpsell__c,IsWon,Is_Current_Subs_equal_to_Renewal_Upsell__c,
            Is_eligibile_for_Premier_support__c,Is_Introduction_done_by_ISV_Partner__c,Is_RoW__c,IT_Implementation_Stage__c,LastActivityDate,
            LastAmountChangedHistoryId,LastCloseDateChangedHistoryId,LastModifiedById,LastModifiedDate,LastReferencedDate,LastStageChangeDate,
            LastViewedDate,LeadSource,Licensed_ARR__c,License_ARR__c,LID__Is_Influenced__c,LID__LinkedIn_Company_Id__c,LinkedIn_URL__c,
            Logged_in_User__c,Loss_Reason__c,Name,NextStep,of_Months_for_Subs_Activation__c,of_Months__c,Opportunity_state__c,Opportunity_Type_New_Renewal_Upsell__c,Opportunity_Type__c,Opportunity__c,
            Opt_Out_Available_Until__c,Opt_Out_Clause__c,Opt_Out_Date__c,Org_ID__c,Other_Competitors__c,Other_Product_Interests__c,
            Overall_Delay__c,OwnerId,Owner_Name_For_Tableau__c,Parent_Opportunity__c,PartnerAccountId,Partner_Account_Referral_Percentage__c,Partner_Account__c,
            Partner_Contact__c,Partner_Influence__c,Partner_Oppty_NewLogo_Upsell_Amount__c,Partner_Oppty_Type__c,Partner_Oppty__c,Partner_Referral_Fee__c,
            Partner_Sourced__c,Partner__c,Plan_Details__c,Playground_POC_Engineer__c,Playground_Set__c,Power_of_One__c,
            Premium_Support__c,Previous_Opportunity__c,Pre_SalesEngineer__c,Pricebook2Id,Primary_AR_Admin__c,Primary_Time_Zone__c,PriorStage__c,
            Probability,Probability_Adjusted_ARR_Amount__c,Probability_Adjusted_Opportunity_Amount__c,Procurement_Complete__c,Procurement_Contact__c,
            Products__c,Product_Name__c,Professional_Services_hours__c,ProServe_Amount__c,PS_Hrs__c,Referral_Percentage__c,
            Renewal_ARR_Amount__c,Renewal_Date_Cntrct_End_Date_90_Days__c,Renewal_No_of_subs__c,Renewal_Subs__c,Renewal__c,Revenue_End_Month__c,
            Revenue_Start_Month__c,ROI_Analysis_Completed__c,Sales_Rep_s_Activity_Comments__c,SDR__c,Security_Complete__c,Services_ARR__c,Service_ARR__c,
            Special_Referral_Terms__c,SSO__c,StageName,Stage_Date__c,Stage_Negotiation_Set_Date__c,Stage_Playground_Set_Date__c,Stage_Proposal_Set_Date__c,
            Stage_Trial_completed_Set_Date__c,Static_Code_Analysis__c,Status__c,Subscription_Activation_Request__c,Subscription_End_Date__c,
            Subscription_Start_Date__c,Subs_Activation_Email_Sent__c,Subs_Upsell__c,Sub_Stage_Probability__c,Sub_Stage_Prob__c,Sub_Stage__c,
            Super_Admin_Release_Manager_Email__c,SystemModstamp,Team_Size__c,Technical_Contact__c,Tentative_Activation_Date__c,
            Testing_Tools__c,This_year_Subs__c,Time_Zone__c,Top_Ten__c,TotalOpportunityQuantity,TotalSubsUpsell__c,Total_ARR_Amount_Current__c,
            Type,Upsell_ARR_Amount__c,Upsell_Subs2__c,
            Upsell_subs__c,Upsell__c,Version_Control_Type__c,Version_Control__c,Waiting_On__c, Account.Name, Hosting_Location__c, 
            Accounts_Payable_Email__c,
            Accounts_Payable_Phone__c,
            Cloud_Organization__c,
            CodeScan_Org_Id__c,
            Data_Storage__c,
            Infrastructure__c,
            Integration__c,
            Partner_Name__c,
            Primary_Campaign_from_Lead__c,
            Reseller__c from Opportunity where Id = :updatedOpps]);
            }
    }
    //public static void afterDelete(List<Opportunity> oldOpportunitys, Map<ID, Opportunity> oldOpportunityMap) {
        // helper.doTask3();
        // helper.doTask1();
    //}
    //public static void afterUndelete(List<Opportunity> newOpportunitys, Map<ID, Opportunity> newOpportunityMap) {
        // helper.doTask4();
        // helper.doTask2();
    //}

}