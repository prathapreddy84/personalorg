public class custext {
    public list<customer__c> lstcusts{get;set;}
    public custext(ApexPages.StandardController controller) {
        lstcusts=[select id,price__c,name from customer__c];
    }

}