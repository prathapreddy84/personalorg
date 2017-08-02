@istest
private class restInsertPatientNewAppDataPostTest
{
static testMethod void testPost() {

    string statusExpected='inventiv';
    
    RestRequest req = new RestRequest(); 
    RestResponse res = new RestResponse();
    req.requestURI = '/services/apexrest/InventivServices/IvrProcess/InsertPatientNewAppDataPost';  
    req.httpMethod = 'Post';
    req.addParameter('patientId', '1390296387');
    req.addParameter('programId', '2390296387');
    req.addParameter('aponCallLogId', '2390296387');
    req.addParameter('callType', '2390296387');
     
    
    RestContext.request = req;
    RestContext.response = res;     
    //restInsertPatientNewAppDataPost.InsertPatientNewAppDataPost();
    system.debug('-----'+res.responseBody.toString());
   /* Dom.Document doc = new Dom.Document();         
    doc.load(res.responseBody.toString());         
    Dom.XMLNode address= doc.getRootElement();  
    String statusActual= address.getChildElement('status', null).getText()  ;          
    String outcomeValueActual= address.getChildElement('outcomeValue', null).getText()  ;
    system.assertEquals(statusActual, statusExpected, 'wrong value');*/
    
        

    }
}