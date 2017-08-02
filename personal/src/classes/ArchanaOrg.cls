public class ArchanaOrg{
        public static void test(){
        String clientid='3MVG9ZL0ppGP5UrAppmiB1prtfk.DPSrtSMbyiemigGHM8thVYDmfWB5ciP0ujV.d_9Q5O_zzWCjV4WvYM7Yr';
        String clientsecret='5545120550387666084';
        String username='archanakoppuravuri@gmail.com';
        String password='Usharani9876@lUtK6QasuG5Oz7iespLwaskqm';
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id='+clientid+'&client_secret='+clientsecret+'&username='+username+'&password='+password);
        HttpResponse res = h.send(req);
        system.debug('>>>>>res.getBody'+res.getBody());
        String accessToken,instance_url;
        JSONParser parser = JSON.createParser(res.getBody());
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME){
                String fieldname = parser.getText();
                parser.nextToken();
                if(fieldname == 'access_token'){
                    accessToken = parser.getText();
                    System.debug('AccessToken is : '+accessToken);
                }
                if(fieldname == 'instance_url'){
                    instance_url = parser.getText();
                    System.debug('InstanceURL : '+instance_url);
                }
            }
        }
        
        if(accessToken != null){
            Http h1 = new Http();
              HttpRequest req2 = new HttpRequest();
              req2.setHeader('Authorization','Bearer '+accessToken );
              req2.setHeader('Content-Type', 'application/JSON');
              req2.setMethod('GET');
               
              req2.setEndpoint(instance_url+'/services/apexrest/1stProgram');
               httpresponse res2 = h1.send(req2);
               system.debug('>>>res2 .body'+res2.getbody());
             

           
        }
        
     
        
    }

}