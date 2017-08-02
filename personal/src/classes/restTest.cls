@istest
private class restTest
{
static testMethod void testPost() {

    string statusExpected='inventiv';
    
    RestRequest req = new RestRequest(); 
    RestResponse res = new RestResponse();
    req.requestURI = '/services/apexrest/sample/sample1';  
    req.httpMethod = 'Post';
    
     res.responseBody=blob.valueOf('hello');
    
    RestContext.request = req;
    RestContext.response = res;     
  
    system.debug('-----'+res.responseBody.toString());
   restPost1.CheckActiveAvailabilityPost1();
        

    }
}