public class sampletriggerclss{
    public void test(list<Bank_Customer__c> bc){
        for(Bank_Customer__c b:bc)
            b.Last_Name__c='hyderabad';
        update bc;
    }
}