public class SorrtedList
{
public List<Test__c> Obj{get;set;}
public void show()
{
Obj = [SELECT Name,score__c FROM Test__c];
list<myInnerClass> wraps = new list<myInnerClass>();
for(Test__c bet: Obj )
{
     wraps.add(new myInnerClass(bet));
}
//wraps.sort();
Obj .clear();
        
        for(myInnerClass MW : wraps){
            Obj.add(MW.myBet);
        }

}
class myInnerClass
{
public Test__c myBet          {get;set;}
public myInnerClass(Test__c bet)
{
myBet = bet;
}
public Integer compareTo(Object compareTo) {
        Test__c betComp = (Test__c )compareTo;
        if (myBet.score__c  == betComp.score__c ){
            return 0;
        } 
        if (myBet.score__c  > betComp.score__c ){
            return -1;
        }
        return 1;  
    }
}
}