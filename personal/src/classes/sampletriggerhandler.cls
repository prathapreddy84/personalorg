public class sampletriggerhandler{
public void test(list<SEZ_Demo__c > lst){
      for(SEZ_Demo__c a:lst){
            a.test1__c='Test';
        }
}
}