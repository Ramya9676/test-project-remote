public class ZohoDeskTickets {
    @future(callout =true)
    public static void getTicketsZohoDesk(){
        ZohoTicketJSON2Apex DeserializedZohoData = new ZohoTicketJSON2Apex();
        Set<Zoho_Ticket2__c> ZohoTicketsToUpsert = new Set <Zoho_Ticket2__c>();
        //new request
        for(integer i = 15000 ; i<=100000 ; i=i+100){
            HttpRequest req = new HttpRequest();
            string  endPointURL = 'callout:ZohoDesk/v1/tickets?from='+i+'&limit=100&fields=id,createdTime,closedTime,webUrl,ticketNumber,status,statusType,priority,accountId,contactId,subject,departmentid&sortBy=createdTime';
            req.setEndpoint(endPointURL);
            req.setMethod('GET');
            req.setTimeout(120000);
            //system.debug('--req--'+req);
            Http http = new Http();
            HTTPResponse response = new HTTPResponse();
            if(!Test.isRunningTest()){
            	response = http.send(req);
                //System.debug(response);
            }else{
                response =  ZohoDeskTicketsMock.respond(req);
            }
            //Response Handle
            //System.debug(response);
            if(response.getStatusCode() == 200 ){
                DeserializedZohoData = ZohoTicketJSON2Apex.parse(response.getBody());
                
                for(ZohoTicketJSON2Apex.Data zohoTicket:DeserializedZohoData.Data){
                    Zoho_Ticket2__c zohoTick = new Zoho_Ticket2__c();
                    zohoTick.Name = zohoTicket.ticketNumber;
                    zohoTick.Zoho_Id__c = zohoTicket.id;
                    if(!String.isBlank(zohoTicket.webUrl)){
                        zohoTick.Web_URL__c = zohoTicket.webUrl;
                    }
                    if(!String.isBlank(zohoTicket.contactId)){
                        zohoTick.Contact_Id__c = zohoTicket.contactId;
                    }
                    if(!String.isBlank(zohoTicket.departmentId)){
                        zohoTick.Department_Id__c = zohoTicket.departmentId;
                    }
                    if(!String.isBlank(zohoTicket.accountId)){
                        zohoTick.Account_Id__c = zohoTicket.accountId;
                    }
                    if(!String.isBlank(zohoTicket.closedTime)){
                        zohoTick.Closed_Time__c = DATETIME.valueOf(zohoTicket.closedTime.replace('T', ' '));
                    }
                    if(!String.isBlank(zohoTicket.priority)){
                        zohoTick.Priority__c = zohoTicket.priority;
                    }
                    if(!String.isBlank(zohoTicket.createdTime)){
                        zohoTick.Created_Time__c = DATETIME.valueOf(zohoTicket.createdTime.replace('T', ' '));
                    }
                    if(!String.isBlank(zohoTicket.statusType)){
                        zohoTick.Status_Type__c = zohoTicket.statusType;
                    }
                    if(!String.isBlank(zohoTicket.status)){
                        zohoTick.Status__c = zohoTicket.status;
                    }
                    if(!String.isBlank(zohoTicket.subject)){
                        zohoTick.Subject__c = zohoTicket.subject;
                    }
                    ZohoTicketsToUpsert.add(zohoTick);
                }
            }
            else{i=100001;}
        }
        
        try{
            if(!ZohoTicketsToUpsert.isEmpty()) {
                List<Zoho_Ticket2__c> ZohoTicketsToUpsertList = new List <Zoho_Ticket2__c>();
                ZohoTicketsToUpsertList.addAll(ZohoTicketsToUpsert);
                upsert ZohoTicketsToUpsertList Zoho_Id__c;
            }
        }
        catch(Exception ex){
            system.debug(ex.getMessage());
        }
        
    }
}