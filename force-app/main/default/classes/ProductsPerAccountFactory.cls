public without sharing class ProductsPerAccountFactory {
    public String AcctId {get;set;}
    public Date DateToCheck {get;set;}
    List<AggregateResult> Records;

    //public void setProductsPerAccount(string theAcctId){
     //string Acct_Id =  '0010K00002UoYCRQA3'; 
       // string AcctId=theAcctId;
   // }
	
	public List<AggregateResult> getProductsPerAccount(){
        //Date DateToCheck = Date.valueOf('2020-01-01');
        //String Acct_Id = '0010K00002UoYCRQA3';
        Records=[select Product2.Name pn, SUM(Quantity) q from OpportunityLineItem where
                  Opportunity.AccountId=:AcctId AND
                  Opportunity.STAGENAME='Closed Won'
                   AND  OPPORTUNITY.OPT_OUT_DATE__C =NULL
                 AND ((Item_Start_Date__c != NULL AND Item_Start_Date__c <= :DateToCheck) OR (Item_Start_Date__c = NULL AND Opportunity.Subscription_Start_Date__c  <= :DateToCheck))
            	 AND Item_End_Date__c >= :DateToCheck
                 and Product2Id != '01t0K000006lGeHQAU'
                 GROUP BY PRODUCT2.NAME
                 ORDER BY PRODUCT2.NAME];
        //System.Debug(Records);
        //System.Debug(Records.size());
        Return Records;
	}
}