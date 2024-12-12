public class ZohoDeskDepartments {
    @future(callout =true)
    public static void getDepartmentsZohoDesk(){
        //new request
        HttpRequest req = new HttpRequest();
        string  endPointURL = 'callout:ZohoDesk/v1/departments?from=0&limit=200&isEnabled=true';
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
        }else{
            response =  ZohoDeskDepartmentsMock.respond(req);
        }
        //Response Handle
        //System.debug(response);
        if(response.getStatusCode() == 200 ){
            ZohoDepartmentJSON2Apex DeserializedZohoData = new ZohoDepartmentJSON2Apex();
            DeserializedZohoData = ZohoDepartmentJSON2Apex.parse(response.getBody());
            //system.debug('-Response--'+response.getBody());
            //system.debug('--deserialize'+JSON.deserializeUntyped(response.getBody()));
            //Map<String, Object> serializeResponseBody = new Map<String, Object>();
            //serializeResponseBody = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            //System.debug('serializeResponseBody>>'+JSON.serializePretty(serializeResponseBody));
            List<Zoho_Department__c> ZohoDepartmentsToUpsert = new list <Zoho_Department__c>();
            for(ZohoDepartmentJSON2Apex.Data zohoDepartment:DeserializedZohoData.Data){
            	Zoho_Department__c zohoDept = new Zoho_Department__c();
                zohoDept.Name = zohoDepartment.name;
                zohoDept.Zoho_Id__c = zohoDepartment.id;
                ZohoDepartmentsToUpsert.add(zohoDept);
            }
            try{
                if(!ZohoDepartmentsToUpsert.isEmpty()) {
                    upsert ZohoDepartmentsToUpsert Zoho_Id__c;
                }
            }
            catch(Exception ex){
            	system.debug(ex.getMessage());
            }
        }
    }
}