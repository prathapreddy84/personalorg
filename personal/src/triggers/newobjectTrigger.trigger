trigger newobjectTrigger on triggerobject__c (before insert,after insert,before update,after update) {
newobjectTriggerclass a=new newobjectTriggerclass();
if(trigger.isbefore && trigger.isinsert){
      a.check(trigger.new); 
 }
if(trigger.isafter && trigger.isinsert){
    a.check1(trigger.new); 
}
 if(trigger.isupdate && trigger.isafter){
      //a.check2(trigger.old,trigger.new); 
      a.check3(trigger.oldmap,trigger.new); 
 }

}