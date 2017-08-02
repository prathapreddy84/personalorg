trigger  AccountTriggertemp on Account (After Insert) {
  if(Trigger.isafter){
    if(Trigger.isinsert){
      List<contact> conlst=new List<Contact>();
      for(Account acct:Trigger.new){
         contact cont=new contact();
         cont.lastname=acct.name;
         cont.accountid=acct.id;
         cont.phone='24728375235702';
         conlst.add(cont);
      }
      if(conlst.size()>0){
         insert conlst;
      }
    }
  }
}