trigger contactcityUpdate on Contact (Before update) {
  if(Utilcls.contrigger==true){
      if(Trigger.isbefore){
        if(Trigger.isupdate){
           Map<Id,String> acctcitymap=new Map<Id,String>();
           for(contact cont:Trigger.new){
               acctcitymap.put(cont.accountid,cont.mailingcity);
           }
           List<Account> acctlst=new List<Account>();
           for(Account acct:[select id,billingcity from account where id in:acctcitymap.keyset()]){
               acct.billingcity=acctcitymap.get(acct.id);
               acctlst.add(acct);
           }
           if(acctlst.size()>0){
              
              Utilcls.accttrigger=false;
              Update acctlst;
              
              
           }
        }
      }
  }
}