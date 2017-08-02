@RestResource(urlMapping='/ReadXML/demo/*')
global class RestXMLClass
{
    @HttpPost
    global static void test()
    {
       RestRequest req = RestContext.request;
       RestResponse res = RestContext.response;
       String reqBody = req.requestBody.toString();
       DOM.Document xmlDOC = new DOM.Document();
       xmlDOC.load(reqBody );
       DOM.XMLNode rootElement = xmlDOC.getRootElement();
       System.Debug('$$$$ Root Element'+rootelement);
       
       for(DOM.XMLNode xmlNodeObj:rootElement.getChildElements()){
       
           System.Debug('$$$ Child Elements'+xmlNodeObj);
           System.Debug('>.jjjj>'+xmlNodeObj.getText());       
       
             
       }
    }
    @HttpPut
    global static void test1()
    {
       RestRequest req = RestContext.request;
       RestResponse res = RestContext.response;
       String reqBody = req.requestBody.toString();
       JSONParser parser = JSON.createParser(reqBody );
       String method = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        while (parser.nextToken() != null) 
        {
              System.debug('jsonStr123 ===>'+parser.getCurrentToken());
             if(parser.getCurrentToken() == JSONToken.FIELD_NAME )
             {
                System.debug('jsonStr ===>'+parser.getText());
                string fieldname = parser.getText();
                parser.nextToken();
                string value = parser.getText();    
                System.debug('value ===>'+value );  
        
             }
        }
        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(reqBody);
        
         string documentURL = (String)m.get('DocumentURL');
        string client1 = (string)m.get('Client');
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('summary', 'hello');
        gen.writeStringField('test', 'test');
        gen.writeEndObject();
        String jsonString = gen.getAsString();
       res.addHeader('Content-Type', 'application/json');
       res.responseBody = blob.valueOf(jsonString );
    }
}