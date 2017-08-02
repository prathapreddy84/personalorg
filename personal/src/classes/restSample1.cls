@RestResource(urlMapping='/Ctrl/Demo1/*')
global class restSample1
{
@HttpGet
    global static void CheckActiveAvailabilityPost1()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String patientId= req .params.get('FirstName');   
        String programID= req .params.get('SecondName');
        system.debug('-------'+   patientId+'------'+programID);
        res.addHeader('Content-Type', 'application/xml');
        string output='Call the class';
        res.responseBody = Blob.valueOf(output);
        system.debug('-------'+   res.responseBody);

    }
     private static  void parse(String toParse) {
      
       DOM.Document xmlDOC = new DOM.Document();
       xmlDOC.load(toParse);
       DOM.XMLNode rootElement = xmlDOC.getRootElement();
       System.Debug('$$$$ Root Element'+rootelement);
       
       for(DOM.XMLNode xmlNodeObj:xmlDOC.getRootElement().getChildElements()){
       
       System.Debug('$$$ Child Elements'+xmlNodeObj);
       for(DOM.XMLNode xmlNodeObjChild:xmlNodeObj.getChildren())
       {
           System.Debug('$$$ Childrens'+xmlNodeObjChild.getChildren());
           
System.Debug('>.>'+xmlNodeObjChild.getText());       
             
         
       }
             
       }
       
      /* if (root.getNodeType() == DOM.XMLNodeType.ELEMENT)
       {
        result += 'Element: ' + root.getName();
        system.debug('>>>>'+result );
        if (root.getText().trim() != '') {
          result += ', text=' + root.getText().trim();
          system.debug('>>>>Text'+result );
        }
        
      }*/ 
     
    }
@HttpPost
    global static void CheckActiveAvailabilityPost()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String patientId= req .params.get('FirstName');   
        String programID= req .params.get('SecondName');
        system.debug('-------'+   patientId+'------'+programID);
        res.addHeader('Content-Type', 'application/xml');
        string output='Call the class';
        String reqBody = req.requestBody.toString();
        system.debug('>>>>reqBody '+reqBody );
        parse(reqBody );
        string sResOutPut = '';
   
   
    
         
        
        sResOutPut = '<?xml version=\'1.0\' encoding=\'UTF-8\'?>';
        sResOutPut += '<result>';
        sResOutPut +='<patientOutcome>' + 'Call the class'+ '</patientOutcome>';
        sResOutPut +='</result>';
        Dom.Document domDoc = new Dom.Document();
        domDoc.load(sResOutPut);
        res.responseBody = Blob.valueOf(output);
        system.debug('-------'+   res.responseBody);

    }
    }