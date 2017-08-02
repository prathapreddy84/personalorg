public class docext {
    public document d{get;set;}
    public string test{get;set;}
    public docext(ApexPages.StandardController controller) {
        d=(Document) controller.getrecord();
        d.name='Sample';
       d.folderid ='00l28000001F6Jx';
    }

}