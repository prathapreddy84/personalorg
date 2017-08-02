public class resttesting{
    public static string test(){
         Http h1 = new Http();
         HttpRequest req1 = new HttpRequest();
           req1.setMethod('GET');
             req1.setEndpoint('http://www.groupkt.com/post/c9b0ccb9/country-and-other-related-rest-webservices.htm');//URL will be your Salesforce REST API end point where you will do POST,PUT,DELETE orGET
          HttpResponse res1 = h1.send(req1);
      system.debug('RESPONSE_BODY'+res1 .getbody());
      return res1.getbody();
    }
}