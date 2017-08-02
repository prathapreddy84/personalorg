@restresource(urlmapping='/XMLDemo/Post/*')
global class RestXMLDemo
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
@httpPost
global static void line1()
{
    system.debug('>>>>>>>>>>>');
    restrequest req=restcontext.request;
    restresponse res=restcontext.response;
    string s=req.requestbody.tostring();
    system.debug('>>>>>>>>>>>'+s);
    string url=req.requestURI;
    system.debug('>>>>>>>>>>>'+url);
   
     XmlRead(s);
     DOM.Document doc = new DOM.Document();
   Dom.Xmlnode rootNode = doc.createRootElement('response', null, null);
   Dom.Xmlnode accountNode = rootNode.addChildElement('Account', null, null);
        accountNode.setAttribute('Firstname','Hello');
        accountNode.setAttribute('Secondname','world');
        accountNode.addTextNode('test');
        system.debug('>>>>>'+doc.toXmlString());   
        res.responsebody=blob.valueof(doc.toXmlString());   
        
  
   
        
}
@httpPut
global static void line()
{



    XmlStreamWriter writer = new XmlStreamWriter();
    restrequest req=restcontext.request;
    restresponse res=restcontext.response;
    string s=req.requestbody.tostring();
    XmlStreamReader xsr = new XmlStreamReader(s);
    boolean status = true;
    while(status) {
    if (xsr.getEventType() == XmlTag.START_ELEMENT) {

    system.debug('>>>>>'+xsr.getLocalName()); 
     if ('firstname' == xsr.getLocalName()) {
     }
     }
     if (xsr.hasNext()) {
        xsr.next();

     }
     else {
         status=false;
         break;
    }
    }


    writer.writeStartDocument('utf-8', '1.0');        
    writer.writeStartElement(null, 'response', null);
     writer.writeStartElement(null, 'Account', null);
     writer.writeAttribute(null, null, 'Firstname', 'Hello');
     writer.writeAttribute(null, null, 'Secondname', 'world');
      writer.writeEndElement();
       writer.writeEndElement();
       
        res.responsebody=blob.valueof(writer.getXmlString());  
          writer.close();     
}

}