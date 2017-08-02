trigger OpportunityTrigger on Opportunity (After Insert,After Update,After Delete,After Undelete) {
  if(Trigger.isAfter){
    if(Trigger.isinsert || Trigger.isUndelete){
       Set<Id> acctidSet=new Set<Id>();
       for(Opportunity opprecd:Trigger.new){
           if(opprecd.accountid!=null && opprecd.stagename=='Closed Won'){
             acctidSet.add(opprecd.accountid);
           }
       }
       Map<id,Decimal> acctsumMap=new Map<Id,Decimal>();
       for(Aggregateresult aggrs:[select Accountid,count(id)cnt,min(Amount)minval,max(Amount)maxval,sum(Amount)total from opportunity where stagename='Closed Won' and accountid in:acctidSet group by accountid]){
           acctsumMap.put((Id)aggrs.get('Accountid'),(Decimal)aggrs.get('total'));
          
       }
       List<Account> acctlst=new List<Account>();
       for(Account acct:[select id,annualrevenue from account where id in :acctidSet]){
          acct.annualrevenue=acctsumMap.get(acct.id);
          acctlst.add(acct);
       }
       if(acctlst.size()>0){
          update acctlst;
       }
    }
    if(Trigger.isUpdate){
        Set<Id> acctidSet=new Set<Id>();
        for(Opportunity oppty:Trigger.new){
            opportunity opptyold=Trigger.oldmap.get(oppty.id);
            if(oppty.stagename=='Closed Won' && opptyold.stagename!='Closed Won' && oppty.accountid!=null){
              acctidSet.add(oppty.AccountId);
            }
            if(oppty.stagename!='Closed Won' && opptyold.stagename=='Closed Won' && oppty.accountid!=null){
               acctidSet.add(oppty.AccountId);
            }
            if(oppty.AccountId!=opptyold.accountid && opptyold.stagename=='Closed Won' && oppty.stagename=='Closed Won'){
               acctidSet.add(oppty.AccountId);
               acctidSet.add(opptyold.AccountId);                
            }
            if(oppty.StageName=='Closed Won' && opptyold.stagename=='Closed Won' && oppty.amount!=opptyold.amount){
                acctidSet.add(oppty.AccountId);                
            }            
        } 
       Map<id,Decimal> acctsumMap=new Map<Id,Decimal>();
       for(Aggregateresult aggrs:[select Accountid,sum(Amount)total from opportunity where stagename='Closed Won' and accountid in:acctidSet group by accountid]){
           acctsumMap.put((Id)aggrs.get('Accountid'),(Decimal)aggrs.get('total'));
          
       }
       List<Account> acctlst=new List<Account>();
       for(Account acct:[select id,annualrevenue from account where id in :acctidSet]){
           if(acctsumMap.containsKey(acct.id)){
             acct.annualrevenue=acctsumMap.get(acct.id);  
               
           }
           else{
               
               acct.annualrevenue=0;
           }
           
          acctlst.add(acct);
       }
       if(acctlst.size()>0){
          update acctlst;
       }
    }
    if(Trigger.isdelete){
        Set<Id> acctidSet=new Set<Id>();
        for(Opportunity oppty:Trigger.old){
            if(oppty.stagename=='Closed Won' && oppty.accountid!=null && oppty.amount!=null){
               acctidSet.add(oppty.AccountId);
            }             
        }
        Map<id,Decimal> acctsumMap=new Map<Id,Decimal>();
       for(Aggregateresult aggrs:[select Accountid,sum(Amount)total from opportunity where stagename='Closed Won' and accountid in:acctidSet group by accountid]){
           acctsumMap.put((Id)aggrs.get('Accountid'),(Decimal)aggrs.get('total'));
          
       }
       List<Account> acctlst=new List<Account>();
       for(Account acct:[select id,annualrevenue from account where id in :acctidSet]){
           if(acctsumMap.containsKey(acct.id)){
             acct.annualrevenue=acctsumMap.get(acct.id);  
               
           }
           else{
               
               acct.annualrevenue=0;
           }
           
          acctlst.add(acct);
       }
       if(acctlst.size()>0){
          update acctlst;
       }
    }    
  
  }
}