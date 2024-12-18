@isTest
global class ZohoDeskTicketsMock implements HttpCalloutMock {
    static global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"data":[{"webUrl":"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069945337","contactId":"241415000064463008","departmentId":"241415000000006907","accountId":"241415000064902193","closedTime":"2022-02-22T14:44:29.000Z","priority":"P2","createdTime":"2022-02-10T19:48:43.000Z","statusType":"Closed","status":"Closed","subject":"Update Salesforce API version to 53","ticketNumber":"41380","id":"241415000069945337"}]}');
        response.setStatusCode(200);
        return response; 
    }
    
}