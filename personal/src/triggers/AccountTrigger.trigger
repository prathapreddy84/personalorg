trigger AccountTrigger on Account (Before insert ,before update,before delete,after insert,after update,after delete,after undelete) {
  if(Trigger.isBefore){
    if(Trigger.isinsert){
       system.debug('***Before Insert***');
       system.debug('***New***'+Trigger.new);
       system.debug('***nemap***'+Trigger.newmap);
       system.debug('***old***'+Trigger.old);
       system.debug('***oldmap***'+Trigger.oldmap);
    }
    if(Trigger.isUpdate){
       system.debug('***Before Update***');
       system.debug('***New***'+Trigger.new);
       system.debug('***nemap***'+Trigger.newmap);
       system.debug('***old***'+Trigger.old);
       system.debug('***oldmap***'+Trigger.oldmap);
    }
    if(Trigger.isDelete){
       system.debug('***Before Delete***');
       system.debug('***New***'+Trigger.new);
       system.debug('***nemap***'+Trigger.newmap);
       system.debug('***old***'+Trigger.old);
       system.debug('***oldmap***'+Trigger.oldmap);
    }
  }
  if(Trigger.isAfter){
    if(Trigger.isinsert){
       system.debug('***After Insert***');
       system.debug('***New***'+Trigger.new);
       system.debug('***nemap***'+Trigger.newmap);
       system.debug('***old***'+Trigger.old);
       system.debug('***oldmap***'+Trigger.oldmap);
    }
    if(Trigger.isUpdate){
       system.debug('***After Update***');
       system.debug('***New***'+Trigger.new);
       system.debug('***nemap***'+Trigger.newmap);
       system.debug('***old***'+Trigger.old);
       system.debug('***oldmap***'+Trigger.oldmap);
    }
    if(Trigger.isDelete){
       system.debug('***After Delete***');
       system.debug('***New***'+Trigger.new);
       system.debug('***nemap***'+Trigger.newmap);
       system.debug('***old***'+Trigger.old);
       system.debug('***oldmap***'+Trigger.oldmap);
    }
    if(Trigger.isUndelete){
      system.debug('***After Undelete***');
       system.debug('***New***'+Trigger.new);
       system.debug('***nemap***'+Trigger.newmap);
       system.debug('***old***'+Trigger.old);
       system.debug('***oldmap***'+Trigger.oldmap);
    }
  }
}