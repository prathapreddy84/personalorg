@isTest
global class OutSiderestApiCallingCalloutMock implements HttpCalloutMock{
  global HttpResponse respond(HTTPRequest req){
   
system.debug('>>>req.getEndpoint'+req.getEndpoint());
    HttpResponse res = new HttpResponse();
    res.setStatus('OK');
    res.setStatusCode(200);
    res.setBody('GREAT SCOTT');
    return res;
  }
}