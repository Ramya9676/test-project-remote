@isTest
global class ZohoDeskAccountsMock implements HttpCalloutMock {
    static global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"data":[{"accountName":"moose","id":"241415000064902193"}]}');
        response.setStatusCode(200);
        return response; 
    }
    
}