public class soapinvoke2
{
    public static void invoke()
    {
        Patner2.Soap a=new Patner2.Soap();
        Patner2.LoginResult  lr=a.login('batch1.integration@ctrla.com','Password@1');
        generalSOAPJSON.soapGenera2 obj=new generalSOAPJSON.soapGenera2();


        obj.sessionHeader = new generalSOAPJSON.sessionHeader_element();
        obj.sessionHeader.sessionid = lr.sessionId;

        string s= obj.test();
        system.debug('>>>'+s);
        
        generalwSDL1.soapGeneral obj1=new  generalwSDL1.soapGeneral();
        
        obj1.sessionHeader = new generalwSDL1.sessionHeader_element();
        obj1.sessionHeader.sessionid = lr.sessionId;
        string s1=obj1.test();
        system.debug('>>>'+s1);

    }
}