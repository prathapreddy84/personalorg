@restresource(urlmapping='/ctrl/Post/*')
global class Post
{
public static void XmlRead(String body)
{
system.debug('>>>>>>>>>>>XMREAD');
    DOM.Document xmlDOC = new DOM.Document();
       xmlDOC.load(body);
       DOM.XMLNode rootElement = xmlDOC.getRootElement();
       System.Debug('$$$$ Root Element'+rootelement);
       Integration__c a=new Integration__c();
       for(DOM.XMLNode xmlNodeObj:rootElement.getChildElements()){
       
           System.Debug('$$$ Child Elements'+xmlNodeObj);
           System.Debug('$$$ Child Elements'+xmlNodeObj.getname());
           System.Debug('>.jjjj>'+xmlNodeObj.getText());       
           string firsname=xmlNodeObj.getname();
           string value=xmlNodeObj.getText();
           if(firsname=='firstname')
             a.First_Name__c=value;
           else if(firsname=='secondname')
               a.Last_Name__c=value;
       }
       insert a;
}



public static void StringRead(String body)
{
list<Integration__c> aaa=[select id,First_Name__c,Last_Name__c from Integration__c];
string responsestring='';
for(Integration__c a:aaa)
{
    responsestring+='FirstName='+a.First_Name__c+','+'SecondName='+a.Last_Name__c +':';
}
restresponse res=restcontext.response;
res.responseBody = blob.valueOf(responsestring);
}



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
    system.debug('>>>>>>>>>>>');
    restrequest req=restcontext.request;
    string s=req.requestbody.tostring();
    system.debug('>>>>>>>>>>>'+s);
    string url=req.requestURI;
    system.debug('>>>>>>>>>>>'+url);
    String method = req.requestURI.substring(url.lastIndexOf('/')+1,url.length());
    system.debug('>>>>>>>>>>>method Name'+method );
    if(method =='JSONRead')
        JSONRead(s);
    else if(method =='XmlRead')
        XmlRead(s);
    else if(method =='StringRead')
        StringRead(s);
     
    /*  Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(s);
        
         string documentURL = (String)m.get('DocumentURL');
        string client1 = (string)m.get('Client');*/
        
}
}