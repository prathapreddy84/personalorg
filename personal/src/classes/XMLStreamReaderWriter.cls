@restresource(urlmapping='/ReadXMLUsingXMLStreamBuffer/demo/*')
global class XMLStreamReaderWriter
{

public static string XmlStreamReadWrite(String body)
{
system.debug('>>>>>>>>>>>XMREAD');
   
        string fname =null;
       string lname=null;
       
       // XmlStreamWriter writer = new XmlStreamWriter();
    
    XmlStreamReader xsr = new XmlStreamReader(body);
    boolean status = true;
    while(status) {
        if (xsr.getEventType() == XmlTag.START_ELEMENT) {
         
            
                system.debug('>>>>>'+xsr.getLocalName()); 
                     if ('Firstname' == xsr.getLocalName()) {
                        
                          xsr.next();
                          if (xsr.getEventType() ==  XmlTag.CHARACTERS)
                          {
                              system.debug('>>>>>fname '+xsr.getText() );
                              fname =xsr.getText();
                          }
                     }
                     else if ('Lastname' == xsr.getLocalName()) {
                        
                          xsr.next();
                          if (xsr.getEventType() ==  XmlTag.CHARACTERS)
                          {
                              system.debug('>>>>>fname '+xsr.getText() );
                              lname =xsr.getText();
                          }
                     }
                 }
                
                 if (xsr.hasNext()) {
                    xsr.next();
            
                 }
                 else {
                     status=false;
                     break;
            }
            
          
    }//end of while loop
       
       list<Restintegration__c> a=[select id from Restintegration__c where firstname__c=:fname and LastName__c=:lname];
       string resstring=null;
       if(a.size()>0)
       {
           resstring   ='record found';
       }
       else
           resstring   ='record not found';
           
     
        //
         XmlStreamWriter writer = new XmlStreamWriter();
        writer.writeStartDocument('utf-8', '1.0');        
    writer.writeStartElement(null, 'response', null);
     writer.writeStartElement(null, 'result', null);
     writer.writeAttribute(null, null, 'value',resstring );
    // writer.writeCharacters('hello');
    
      writer.writeEndElement();
       writer.writeEndElement();
       
       
        resstring = writer.getXmlString();
          writer.close(); 
          return resstring ;    
      
      }   


   @httppost
   global static void readXML()
   {
       restrequest req=restcontext.request;
       string s=req.requestbody.tostring();
       system.debug('>>>>>'+s);
       string resstring=XmlStreamReadWrite(s);
      
       restresponse res=restcontext.response;
       res.responsebody=blob.valueof(resstring);
       
   
   } 
}