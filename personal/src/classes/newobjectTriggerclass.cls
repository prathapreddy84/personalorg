public class newobjectTriggerclass{
    list<dependentObject__c> lstdepobj=new list<dependentObject__c>();
    public void check(list<triggerobject__c > lsttrgobj){
            for(triggerobject__c c:lsttrgobj){
           
                if(c.Price__c==null)
                    c.addError('Please eneter the price value from trigger');
                 if(string.isblank(c.State__c))
                    c.addError('Please eneter the state value from trigger');
                 c.expiration_Date__c=date.today().adddays(30);
            }
       
        }
        public void check1(list<triggerobject__c > lsttrgobj){
            for(triggerobject__c c:lsttrgobj){
           
               dependentObject__c d=new dependentObject__c();
                d.name=c.name;
                d.triggerobject__c=c.id;
                lstdepobj.add(d);
            }
            insert lstdepobj;
       
        }
        public void check2(list<triggerobject__c > lstoldtrgobj,list<triggerobject__c > lstnewtrgobj){
        list<test12__c> testlst=new list<test12__c>();
          for(triggerobject__c  n:lstnewtrgobj){
               for(triggerobject__c  o:lstoldtrgobj){
                   if(n.id==o.id && n.price__c != o.price__c)
                   {
                       test12__c t=new test12__c();
                       t.name=o.name;
                       t.customer__c='a0S28000004q9TH';
                       t.price__c =n.price__c ;
                       testlst.add(t);
                   }
               }
          }
          insert testlst; 
        }
        public void check3(map<id,triggerobject__c > lstoldtrgobj,list<triggerobject__c > lstnewtrgobj){
          list<test12__c> testlst=new list<test12__c>();
          for(triggerobject__c  n:lstnewtrgobj){
              triggerobject__c  oldrec=lstoldtrgobj.get(n.id);
              if(n.price__c != oldrec.price__c){
                   test12__c t=new test12__c();
                   t.name=oldrec.name;
                   t.customer__c='a0S28000004q9TH';
                   t.price__c =n.price__c ;
                   testlst.add(t);
              }
              
          }
          insert testlst; 
        }
   
        
    
}