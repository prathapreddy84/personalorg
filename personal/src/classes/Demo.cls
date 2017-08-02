@RestResource(urlMapping='/CtrlA/demo1/*')
global class Demo
{
    @HttpGet
    global static void test()
    {
        RestRequest req= restcontext.request;
        RestResponse res= restcontext.response;
        String firstName=req.params.get('FirstName');
        String SecondName=req.params.get('SecondName');
        system.debug('>>>firstName'+firstName);
        system.debug('>>>SecondName'+SecondName);
        list<Integration__c> intrecords1=[select id,name,First_Name__c,Last_Name__c from Integration__c];
        for(Integration__c a:intrecords1)
        {
            system.debug('>>>SecondName'+a.First_Name__c);
            system.debug('>>>firstName'+a.Last_Name__c);
            
        }
        list<Integration__c> intrecords=[select id,name from Integration__c where First_Name__c=:firstName and Last_Name__c=:SecondName];
         string test=null;
        if(intrecords.size()>0)
        {
            test='Record Found';
        }
        else
        {
             test='Record Not Found';
             Integration__c tes=new Integration__c();
             tes.First_Name__c=firstName;
             tes.Last_Name__c=SecondName;
             insert tes;
        }
        system.debug('>>>Test');
      //  return 'Demo';
     
      res.responseBody = blob.valueOf(test);
      
    }
  }