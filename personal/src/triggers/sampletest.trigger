trigger sampletest on Position__c (before insert,after insert, after delete) {
    list<id> delposition=new list<id>();
    for(Position__c p:trigger.new){
        if(trigger.isafter && trigger.isdelete){
            delposition.add(p.id);
        }
    }
    list<Job_Application__c> jobApplicationsToDelete=[select id from Job_Application__c where Position__c in:delposition];
    delete  jobApplicationsToDelete;
}