public class SCOwnclass {
    public customer__c cust{get;set;}
    public integer count{get;set;}
    public ApexPages.StandardController scontroller;
    public SCOwnclass(ApexPages.StandardController controller) {
        this.cust = (customer__c )controller.getRecord();
        scontroller=controller;

    }
    public void saveREC(){
        
        system.debug('>>>>');
        if(cust.Price__c==50)
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'should eneter 50 for price'));
        else   
            scontroller.save();
       // insert cust;
        
    }
    public void createchldrec(){
        sales__c s=new sales__c();
        s.name='test';
        insert s;
    }

}