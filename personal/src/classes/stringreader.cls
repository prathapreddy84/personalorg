@restresource(urlmapping='/Readstring/demo/*')
global class stringreader
{
@httpGet
   global static void readstring1()
   {
   }
   @httppost
   global static void readstring()
   {
       restrequest req=restcontext.request;
       string s=req.requestbody.tostring();
       system.debug('>>>>>'+s);
       String[] result=s.split(';');
       for(integer i=0;i<result.size();i++)
       {
           system.debug('>>>>>'+result[i]);
       }
       string fname=result[0].substring(result[0].indexof('=')+1,result[0].length());
       string lname=result[1].substring(result[1].indexof('=')+1,result[1].length());
       system.debug('>>>>>fname'+fname);
       system.debug('>>>>>lname'+lname);
       
       list<Restintegration__c> a=[select id from Restintegration__c where firstname__c=:fname and LastName__c=:lname];
       string resstring=null;
       if(a.size()>0)
       {
           resstring   ='record found';
       }
       else
           resstring   ='record not found';
       restresponse res=restcontext.response;
       res.responsebody=blob.valueof(resstring);
       
   
   } 
}