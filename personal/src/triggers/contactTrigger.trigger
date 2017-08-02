trigger contactTrigger on Contact (before insert,before update,before delete) {
  if(Trigger.isBefore){
     if(Trigger.isinsert || Trigger.isUpdate){
        for(contact conrecd:Trigger.new){
           if(conrecd.phone==null || conrecd.phone==''){
              conrecd.phone.adderror('Phone number not filled for this contact');
              //conrecd.phone='943943434934';
           }
        }
     
     }
  /*   if(Trigger.isupdate){
        for(contact conrecd:Trigger.new){
           if(conrecd.phone==null || conrecd.phone==''){
              conrecd.phone.adderror('Phone number not filled for this contact');
              //conrecd.phone='943943434934';
           }
        }
     
     } */
     if(Trigger.isdelete){
        string profilename=[select id,name from profile where id=:userinfo.getprofileid() limit 1].name;
        

        for(contact con:Trigger.old){
           if(profilename!='System Administrator'){
             con.adderror('You are not allowed to delete contacts');
           }
           
        }
     }
  
  }
}