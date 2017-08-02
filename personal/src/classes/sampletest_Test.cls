@istest
public class sampletest_Test{
    public static testmethod void test()
    {
        /*Position__c  p=new Position__c();
        p.Name='test';
        insert p;
        Job_Application__c jp=new Job_Application__c();
        jp.Status__c='test';
        jp.Position__c=p.id;
        insert jp;
        list<Position__c > pp=[select id from Position__c ];
        system.debug('>>>'+pp.size());
        delete p;*/
        
        first f=new first();
        f.show();
    }
}