public class soapinvoke1
{
    public static void invoke()
    {
        Patner2.Soap a=new Patner2.Soap();
        Patner2.LoginResult  lr=a.login('batch1.integration@ctrla.com','Password@1');
        generalwSDL1.soapGeneral obj=new  generalwSDL1.soapGeneral();


        obj.sessionHeader = new generalwSDL1.sessionHeader_element();
        obj.sessionHeader.sessionid = lr.sessionId;

        string s= obj.test();
        system.debug('>>>'+s);
    }
}