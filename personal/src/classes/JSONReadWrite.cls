@restresource(urlmapping='/ReadWriteKJSON/demo/*')
global class JSONReadWrite
{

public static string JSONReadWrite(String body)
{
        JSONParser parser = JSON.createParser(body);
    restresponse res=restcontext.response;
      Restintegration__c a=new Restintegration__c();
       
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
                 a.name='Hello world'; 
                if(fieldname =='Firstname')
                             a.firstname__c=value;
                else if(fieldname =='LastName')
                       a.LastName__c=value;
                 
                 else if(fieldname =='City')
                       a.city__c=value;
                 else if(fieldname =='Address')
                       a.address__c=value;
                  else if(fieldname =='State')
                       a.state__c=value;
                  else if(fieldname =='Zip')
                       a.zip__c=value;
               } 
        
         }
         INSERT a;
         
         JSONGenerator gen = JSON.createGenerator(true);
          gen.writeStartObject();
        
        gen.writeStringField('Result', 'hello');
        gen.writeStringField('value', a.id);
         gen.writeFieldName('account details');
          gen.writeStartObject();
        gen.writeStringField('FirstName', a.firstname__c);
         gen.writeStringField('LastName', a.LastName__c);
          gen.writeNumberField('number',1234);
        gen.writeEndObject();

         
        gen.writeEndObject();
       
       
        String jsonString = gen.getAsString();
      

          return jsonString ;    
      
      }   
    @httpPut
    global static void readlJSON()
    {
         restrequest req=restcontext.request;
       string s=req.requestbody.tostring();
       Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(s);
     
     
  Restintegration__c a=new Restintegration__c();
       a.firstname__c=(String)m.get('Firstname');
                
       a.LastName__c=(String)m.get('LastName');
 

       a.city__c=(String)m.get('City');
 
       a.address__c=(String)m.get('Address');
 
       a.state__c=(String)m.get('State');
  
       a.zip__c=(String)m.get('Zip');
        insert a;
    }

   @httppost
   global static void readXML()
   {
       restrequest req=restcontext.request;
       string s=req.requestbody.tostring();
       system.debug('>>>>>'+s);
       string resstring=JSONReadWrite(s);
      
       restresponse res=restcontext.response;
        res.addHeader('Content-Type', 'application/json');

       res.responsebody=blob.valueof(resstring);
       
   
   } 
}