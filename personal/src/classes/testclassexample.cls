public class testclassexample{
    public void test1(id accid){
        system.debug('>>>>>accid'+accid);
        account a=[select id from account where id=:accid];
        list<account> a2=[select id from account ];
        system.debug('>>>>accountsize'+a2.size());
        customer__c a1=new customer__c();
        a1.name='test class';
        a1.state__c='AP';
        a1.price__c=1000;
        insert a1;
        
    }
}