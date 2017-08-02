public class custext1 {
    public list<customer__c> lstcust{get;set;}
    public customer__c c{get;set;}
    public boolean render{get;set;}
    public custext1(ApexPages.StandardController controller) {
        c=(customer__c)controller.getrecord();
        render=false;

    }
    public void showRec(){
        lstcust=[select id,name from customer__c where State__c=:c.State__c];
        render=true;
        
    }

}