public class restApiCalling1
{
   // @future(callout=true)
    public static void test()
    {
       // Settings__c ts=settings;//Here write a sample query or fetch from custom settings the consumer ,client secret and username and password of destination org

String clientId = '3MVG9ZL0ppGP5UrCZtYq96VNVIjTG3K7ESxcugDw4Liydz0pWp4uyj_tszE2oflYbMnqKTr09N0Rt140HOcpB';
String clientSecret = '9186374699828200439';
String username='integrations@sf.com';
String password='abcd12345';
system.debug('>>>>>');


String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;

Http h = new Http();
HttpRequest req = new HttpRequest();
//req.setBody(reqbody);
req.setMethod('POST');
req.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id='+clientId +'&client_secret='+clientSecret+'&username='+username+'&password='+password);//Note if my domain is set up use the proper domain name else use login.salesforce.com for prod or developer or test.salesforce.com for sandbox instance

HttpResponse res = h.send(req);
system.debug('>>>>>'+res);
system.debug('>>>>>'+res.getBody());
system.debug('*******'+req.getEndpoint());
 JSONParser parser = JSON.createParser(res.getBody());
 system.debug('++++++'+parser);
        String accessToken;
        string instance_url;
        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
                String fieldName = parser.getText();
                parser.nextToken();
                if(fieldName == 'access_token') {
                    accessToken =  parser.getText();
                    system.debug('&&&&&&'+accesstoken);
                }
                if(fieldName == 'instance_url') {
                    instance_url=parser.getText();
                }
                
            }
        }

if(accessToken !=null){
string jsonstr='hello';
system.debug('>>>accessToken '+accessToken );
system.debug('>>>instance_url'+instance_url);
  Http h1 = new Http();
  HttpRequest req1 = new HttpRequest();
  req1.setHeader('Authorization','Bearer '+accessToken );
  //req1.setHeader('Content-Length', '0');
  //req1.setBody(jsonstr);//Send JSON body
  req1.setMethod('GET');
  req1.setEndpoint(instance_url+'/services/apexrest/rest');//URL will be your Salesforce REST API end point where you will do POST,PUT,DELETE orGET
  HttpResponse res1 = h1.send(req1);
  system.debug('RESPONSE_BODY'+res1 .getbody());
  
  
  req1 = new HttpRequest();
  req1.setHeader('Authorization','Bearer '+accessToken );
  req1.setMethod('POST');
 // req1.setBody('hello');

 req1.setHeader('Content-Length', '0');
  req1.setEndpoint(instance_url+'/services/apexrest/rest');
   res1 = h1.send(req1);
   
   
   
   system.debug('RESPONSE_BODY'+res1 .getbody());
   
   
   req1 = new HttpRequest();
  req1.setHeader('Authorization','Bearer '+accessToken );
  req1.setMethod('GET');
 // req1.setBody('hello');


  req1.setEndpoint(instance_url+'/services/apexrest/rest/demo1');
   res1 = h1.send(req1);
   system.debug('RESPONSE_BODY'+res1 .getbody());
  
  
    }
    }
}