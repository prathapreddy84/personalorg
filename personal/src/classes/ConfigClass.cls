@restresource(urlmapping='/ctrl/Config/*')
global class ConfigClass
{
   global static Configuration__c  getconfigrecord(list<Configuration__c> config,string fieldname,string forname)
   {
       for(Configuration__c a:config)
       {
           if(a.Form__c==forname && a.Name__c==fieldname )
               return a;
       }
       return null;
   }
    @httppost
    global static void createrecords()
    {
      restrequest req=restcontext.request;
      string body=req.requestbody.tostring();
         JSONParser parser = JSON.createParser(body);
         Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(body);
        
         string forname= (String)m.get('form');
        
    restresponse res=restcontext.response;
      //Integration__c a=new Integration__c();
       list<Configuration__c> config=[select id,Form__c,Name__c,TargetAPIname__c from Configuration__c where Form__c=:forname];
       integration__C inte=new integration__C ();
       inte.name='Config5';
        while (parser.nextToken() != null) 
        {
              System.debug('jsonStr123 ===>'+parser.getCurrentToken());
             if(parser.getCurrentToken() == JSONToken.FIELD_NAME )
             {
                System.debug('jsonStr ===>'+parser.getText());
                string fieldname = parser.getText();
                parser.nextToken();
                string value = parser.getText();    
                if(fieldname.contains('Field'))
                {
                   Configuration__c aa=getconfigrecord(config,fieldname,forname);
                   system.debug('>>>>>'+aa);
                    inte.put(aa.TargetAPIname__c,value );
                }
                
         }
    }
    insert inte;
    }
}