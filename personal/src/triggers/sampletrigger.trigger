trigger sampletrigger on Bank_Customer__c (after insert) {
    sampletriggerclss s=new sampletriggerclss();
    s.test(trigger.new);

}