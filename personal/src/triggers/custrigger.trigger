trigger custrigger on customer__c (before insert,after insert) {
    
    for(customer__c c:trigger.new){
        if(trigger.isbefore){
            if(c.Price__c==null)
                c.addError('Please eneter the price value from trigger');
             if(string.isblank(c.State__c))
                c.addError('Please eneter the state value from trigger');
        }
        if(trigger.isafter){    
        // c.expiration_Date__c=c.createddate.date().adddays(30);
         }
        
    }
    

}