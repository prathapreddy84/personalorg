@RestResource(urlMapping='/CtrlA/demo/*')
global class SampleRestClass
{
  
     @HttpGet
     global static void GetTimeStamps() {
     system.debug('>>>Hello');
     }
       @HttpPost
    global static string handleDocument(){
        RestRequest req = RestContext.request;
        String reqBody = req.requestBody.toString();
        
          
        RestResponse res = RestContext.response;
        res.addHeader('Content-Type', 'application/json');
        String jsonResponse = '';
        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(reqBody);
         string documentURL = (String)m.get('DocumentURL');
        string client1 = (string)m.get('Client');
        
        JSONParser parser = JSON.createParser(reqBody );
        while (parser.nextToken() != null) 
        {
              System.debug('jsonStr123 ===>'+parser.getCurrentToken());
             if(parser.getCurrentToken() == JSONToken.FIELD_NAME )
             {
                System.debug('jsonStr ===>'+parser.getText());
                string fieldname = parser.getText();
                parser.nextToken();
                string value = parser.getText();      
        
             }
        }
        res.responseBody = blob.valueOf(documentURL );
        return jsonResponse;
        }
        
}