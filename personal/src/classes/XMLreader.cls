@restresource(urlmapping='/ReadXML1/demo/*')
global class XMLreader
{

public static string XmlDOMReadWrite(String body)
{
system.debug('>>>>>>>>>>>XMREAD');
    DOM.Document xmlDOC = new DOM.Document();
       xmlDOC.load(body);
       DOM.XMLNode rootElement = xmlDOC.getRootElement();
       System.Debug('$$$$ Root Element'+rootelement);
        string fname =null;
       string lname=null;
       
       for(DOM.XMLNode xmlNodeObj:rootElement.getChildElements()){
       
           System.Debug('$$$ Child Elements'+xmlNodeObj);
           System.Debug('$$$ Child Elements'+xmlNodeObj.getname());
           System.Debug('>.jjjj>'+xmlNodeObj.getText());       
           string firsname=xmlNodeObj.getname();
           string value=xmlNodeObj.getText();
           if(firsname=='FirstName')
               fname=value;
           else if(firsname=='SecondName')
               lname=value;
           
         
       }
       
       list<Restintegration__c> a=[select id from Restintegration__c where firstname__c=:fname and LastName__c=:lname];
       string resstring=null;
       if(a.size()>0)
       {
           resstring   ='record found';
       }
       else
           resstring   ='record not found';
           
             DOM.Document doc1 = new DOM.Document();
   Dom.Xmlnode rootNode1 = doc1.createRootElement('response', null, null);
   Dom.Xmlnode accountNode1 = rootNode1.addChildElement('Result', null, null);
        accountNode1.setAttribute('value',resstring   );
        accountNode1.setAttribute('sample','HelloWorld');
        
        accountNode1.addTextNode('test');
        system.debug('>>>>>'+doc1.toXmlString());   
       
        return resstring =doc1.toXmlString()  ;
      
      }   


   @httppost
   global static void readXML()
   {
       restrequest req=restcontext.request;
       string s=req.requestbody.tostring();
       system.debug('>>>>>'+s);
       string resstring=XmlDOMReadWrite(s);
      
       restresponse res=restcontext.response;
       res.responsebody=blob.valueof(resstring);
       
   
   } 
}