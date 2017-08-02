@restresource(urlmapping='/JSONDemo/Post/*')
global class RestJSONDemo
{
    public static void JSONRead(String body)
{
system.debug('>>>>>>>>>>>JSONREAD');
    JSONParser parser = JSON.createParser(body);
    restresponse res=restcontext.response;
      Integration__c a=new Integration__c();
       
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
                if(fieldname =='firstname')
                             a.First_Name__c=value;
                   else if(fieldname =='SecondName')
                       a.Last_Name__c=value;
               } 
        
         }
         INSERT a;
         //write JSON
         JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('summary', 'hello');
        gen.writeStringField('test', 'test123');
        gen.writeEndObject();
        String jsonString = gen.getAsString();
       res.addHeader('Content-Type', 'application/json');
       res.responseBody = blob.valueOf(jsonString );
}
@httpPost
global static void line()
{
    restrequest req=restcontext.request;
    restresponse res=restcontext.response;
    string s=req.requestbody.tostring();
    JSONRead(s);
}
@httpPut
global static void line1()
{
    restrequest req=restcontext.request;
    restresponse res=restcontext.response;
    string s=req.requestbody.tostring();
  
     Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(s);
     string firstname= (String)m.get('firstname');
     System.debug('firstname>>>'+firstname);
}

       
        
         
}