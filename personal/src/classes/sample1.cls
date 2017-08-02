public class sample1 {
public string test{get;set;}
public list<position__c> pos{get;set;}
    public sample1()
    {
        test='test';
        pos=[select id,name from position__c];
    }
}