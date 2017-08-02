@restresource(urlmapping='/demo1/*')
global class demo1
{
    @httpget
    global static void test()
    {
        system.debug('>>>>test');
        RestRequest req= restcontext.request;
        RestResponse res= restcontext.response;
         system.debug('>>>>req'+req);
        String firstName=req.params.get('FirstName');
        String lastName=req.params.get('LastName');
        system.debug('>>>>firstName'+firstName);
         system.debug('>>>>lastName'+lastName);
        
      list<Restintegration__c>  a = [select id,name,firstname__c,LastName__c from Restintegration__c where firstname__c=:firstName and LastName__c=:lastName];  
      string result='';
      if(a.size()>0)
      {
          result='Record exists';
      }
      else
          result='Record doesnt exists';
       res.responseBody = blob.valueOf(result);
    }
    @httpPost
    global static string test1()
    {
        system.debug('>>>>test');
        RestRequest req= restcontext.request;
        RestResponse res= restcontext.response;
         system.debug('>>>>req'+req);
        String firstName=req.params.get('FirstName');
        String lastName=req.params.get('LastName');
        system.debug('>>>>firstName'+firstName);
         system.debug('>>>>lastName'+lastName);
        
      list<Restintegration__c>  a = [select id,name,firstname__c,LastName__c from Restintegration__c where firstname__c=:firstName and LastName__c=:lastName];  
      string result='';
      if(a.size()>0)
      {
          result='Record exists';
      }
      else
          result='Record doesnt exists';
          return result;
    }
    
}