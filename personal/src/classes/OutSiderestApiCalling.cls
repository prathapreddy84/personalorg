public class OutSiderestApiCalling
{
    public static string test()
    {
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setMethod('GET');
        req.setEndpoint('http://www.thomas-bayer.com/sqlrest/CUSTOMER/');
        
        HttpResponse res = h.send(req);
        system.debug('>>>>>'+res);
        system.debug('>>>>>'+res.getBody());
        return res.getBody();
    }
}