trigger LeadTrigger on Lead (Before insert,before update,After insert,After update) {
  if(Trigger.isBefore){
    if(Trigger.isinsert){
       LeadTriggerhelper.insertbefore(Trigger.new);
       
    }
    if(Trigger.isUpdate){
       LeadTriggerhelper.updatebefore(Trigger.new,Trigger.newmap);
    }
  }
}