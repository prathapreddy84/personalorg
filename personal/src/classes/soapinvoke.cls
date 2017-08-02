public class soapinvoke
{
    public static void invoke()
    {
        Patner2.Soap a=new Patner2.Soap();
        Patner2.LoginResult  lr=a.login('batch1.integration@ctrla.com','Password@1');
        generalwSDL.soapGeneral obj=new  generalwSDL.soapGeneral();


        obj.sessionHeader = new generalwSDL.sessionHeader_element();
        obj.sessionHeader.sessionid = lr.sessionId;

        obj.test();
    }
}