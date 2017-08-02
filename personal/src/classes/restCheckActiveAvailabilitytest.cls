@istest
private class restCheckActiveAvailabilitytest
{
static testMethod void testGet() {

RestRequest req = new RestRequest(); 
    RestResponse res = new RestResponse();
    req.requestURI = '/services/apexrest//InventivServices/IvrProcess/CheckActiveAvailabilityGet';  
    req.httpMethod = 'Get';
     req.addParameter('patientId', '1390296387');
      req.addParameter('programId', '2390296387');
    RestContext.request = req;
    RestContext.response = res;
  
       

        restCheckActiveAvailability.CheckActiveAvailabilityGet();
       
        system.debug('-----'+res.responseBody.toString());
   Dom.Document doc = new Dom.Document();         
   doc.load(res.responseBody.toString());         
   Dom.XMLNode address= doc.getRootElement();         
   /* for(Dom.XMLNode child : address.getChildElements()) {
           System.debug('-----patientId----:'+child.getText());
        }*/
   
    
    String name = address.getChildElement('patientOutcome', null).getText()  ;
    System.debug('-----llll'+name );
    system.assertEquals('prathap', name , 'wromng value');
        

    }
}