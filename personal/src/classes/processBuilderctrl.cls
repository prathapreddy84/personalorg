public class processBuilderctrl{
@invocablevariable public id cusid;
    @invocablemethod(label='Get Cusomer Records' )
    public static void test(){
        list<customer__c> cst=[select id from customer__c];
        system.debug('>>>>>customer__c'+cst.size());
    }
}