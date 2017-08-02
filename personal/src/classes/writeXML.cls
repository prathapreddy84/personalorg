public class writeXML
{
    public void write()
    {
        String soapNS = 'http://schemas.xmlsoap.org/soap/envelope/';
        String servicePrefix ='glob';
        String serviceNS = 'http://www.myservice.com/services/MyService/';
        DOM.Document doc = new DOM.Document();
        dom.XmlNode envelope = doc.createRootElement('Envelope', 'test', 'soapenv');
        //dom.XmlNode envelope =doc.createRootElement();
        //envelope.setNamespace(servicePrefix, serviceNS);
             
        dom.XmlNode body = envelope.addChildElement('Body', soapNS, null);     
        body.addChildElement('echo', serviceNS, 'req').addChildElement('category', serviceNS, null).addTextNode('classifieds');
        string s=doc.toXmlString();
        system.debug('>>>'+s);
    }
}