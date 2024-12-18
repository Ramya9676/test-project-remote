public class ZohoDeskAccounts {
    @future(callout =true)
    public static void getAccountsZohoDesk(){
        ZohoAccountJSON2Apex DeserializedZohoData = new ZohoAccountJSON2Apex();
        Set<Zoho_Account__c> ZohoAccountsToUpsert = new Set <Zoho_Account__c>();
        //string rgb = '';
        //new request
        for(integer i = 0 ; i<=10000 ; i=i+100){
            HttpRequest req = new HttpRequest();
            string  endPointURL = 'callout:ZohoDesk/v1/accounts?from='+i+'&limit=100&sortBy=accountName&fields=accountName,id';
            //string  endPointURL = 'callout:ZohoDesk/v1/tickets/search?from='+i+'&limit=100&sortBy=createdTime&createdTimeRange='+StartDate+','+EndDate;
            //string  endPointURL = 'callout:ZohoDesk/v1/ticketsCountByFieldValues?departmentId=241415000063557074&field=statusType,priority&createdTimeRange='+StartDate+','+EndDate;
            req.setEndpoint(endPointURL);
            req.setMethod('GET');
            //req.setHeader('Content-Type','application/json');
            //req.setHeader('Accept','application/json'); 
            //req.setHeader('Content-Length', '512');
            //req.setBody(jsonData);
            req.setTimeout(120000);
            //system.debug('--req--'+req);
            Http http = new Http();
            HTTPResponse response = new HTTPResponse();
            if(!Test.isRunningTest()){
            	response = http.send(req);
                //System.debug(response);
            }else{
                response =  ZohoDeskAccountsMock.respond(req);
            }
            //Response Handle
            //System.debug(response);
            System.debug(response.getBody());
            if(response.getStatusCode() == 200){
                //rgb = rgb + response.getBody();
                DeserializedZohoData = ZohoAccountJSON2Apex.parse(response.getBody());
                
                for(ZohoAccountJSON2Apex.Data zohoAccount:DeserializedZohoData.Data){
                    Zoho_Account__c zohoAcct = new Zoho_Account__c();
                    zohoAcct.Name = zohoAccount.accountName;
                    zohoAcct.Zoho_Id__c = zohoAccount.id;
                    ZohoAccountsToUpsert.add(zohoAcct);
                }
            }
            else{i=10001;}
        }
        
        try{
            if(!ZohoAccountsToUpsert.isEmpty()) {
                List<Zoho_Account__c> ZohoAccountsToUpsertList = new List <Zoho_Account__c>();
                ZohoAccountsToUpsertList.addAll(ZohoAccountsToUpsert);
                upsert ZohoAccountsToUpsertList Zoho_Id__c;
            }
        }
        catch(Exception ex){
            system.debug(ex.getMessage());
        }
        
        
        //system.debug('-Response--'+response.getBody());
        //system.debug('--deserialize'+JSON.deserializeUntyped(response.getBody()));
        //Map<String, Object> serializeResponseBody = new Map<String, Object>();
        //serializeResponseBody = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        //System.debug('serializeResponseBody>>'+JSON.serializePretty(serializeResponseBody));
        
    }
}