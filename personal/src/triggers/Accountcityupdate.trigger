trigger Accountcityupdate on Account (Before update) {
   if(Utilcls.accttrigger==true){
       if(Trigger.isbefore){
          if(Trigger.isupdate){
             List<contact> contlst=new List<contact>();
             for(contact conrecd:[select id,mailingcity,accountid from contact where accountid in :Trigger.newmap.Keyset()]){
                 conrecd.mailingcity=Trigger.newmap.get(conrecd.accountid).billingcity;
                 contlst.add(conrecd);
             }
             if(contlst.size()>0){
                
                Utilcls.contrigger=false;
                
                update contlst;
                
             }
          }
       }
   }
}