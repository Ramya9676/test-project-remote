@isTest
global class ZohoDeskDepartmentsMock implements HttpCalloutMock {
    static global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"data":[{"isDefault":true,"sanitizedName":"AutoRABIT","isVisibleInCustomerPortal":true,"isEnabled":true,"isAssignToTeamEnabled":true,"chatStatus":true,"hasLogo":true,"nameInCustomerPortal":"AutoRABIT","creatorId":"241415000070365001","createdTime":"2022-02-18T04:07:57.000Z","description":"AutoRABIT","name":"AutoRABIT","id":"241415000064902193"}]}');
        response.setStatusCode(200);
        return response; 
    }
    
}