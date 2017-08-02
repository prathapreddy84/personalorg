public class restCallingPage {
public string jsonString{get;set;}
    public restCallingPage(){
        jsonString='prathap';
    }
    public void callendpoint(){
        jsonString=resttesting.test();
        system.debug('>>>>>'+jsonString);
    }
}