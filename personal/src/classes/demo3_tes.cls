@istest
public class demo3_tes
{
static testMethod void testPost() {
    RestRequest req = new RestRequest(); 
    RestResponse res = new RestResponse();
    req.requestURI = '/services/apexrest/testPost/';  
    req.httpMethod = 'Post';
     RestContext.request = req;
    RestContext.response = res; 
    //req.addParameter('patientId', '1390296387');
    
}
}