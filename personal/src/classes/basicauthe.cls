public class basicauthe{
    public void test(){
        HTTP h = new HTTP();
HTTPRequest r = new HTTPRequest();
r.setEndpoint('https://login.salesforce.com');
Blob headerValue = Blob.valueOf( 'sprathap@sf.com:work44%GE1234567' );
String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
r.setHeader('Authorization', authorizationHeader);
r.setMethod('GET');
HTTPResponse resp = h.send(r);
system.debug('>>>'+resp);
    }
}