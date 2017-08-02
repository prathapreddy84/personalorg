@istest
public class TestCovarage_Test
{
   static testMethod void testPost() {
       restrequest req=new restrequest();
       restresponse res=new restresponse();
       req.requestURI = '/services/apexrest/TestCovarage';  
       req.httpMethod = 'Post';
       req.addParameter('patientId', '1390296387');
    
     req.requestbody=blob.valueOf('hello');
      
    
    RestContext.request = req;
    RestContext.response = res;
       RestTestCovarage.test1();
       
   } 
}