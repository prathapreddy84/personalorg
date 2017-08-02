global class examplebatch2 implements database.batchable<sObject>,Database.stateful{
 global integer count=0;
    global database.querylocator start(database.batchableContext bc){
        string q='select id,name,price__c from customer__c';
        return database.getquerylocator(q);
    }
    global void execute(database.batchableContext bc,list<customer__c> scope){
        for(customer__c c:scope){
            c.price__c+=2000;
            count+=integer.valueof(c.price__c);
            c.name=c.name+'Updated from batchapex';
        }
        update scope;
    }
    global void finish(database.batchableContext bc){
        AsyncApexJob a=[select id,status,numberoferrors,jobitemsprocessed,totaljobitems,createdby.email from AsyncApexJob where id=:bc.getjobId()];
        Messaging.singleEmailMessage mail=new Messaging.singleEmailMessage();
        string[] toadd=new string[]{'spprathap2003@gmail.com',a.createdby.email};
        mail.settoAddresses(toadd);
        mail.setsubject('Email');
        mail.setPlainTextBody('This is a email body ans its status is'+a.status +'and failure count'+a.numberoferrors+ 'and total price is'+count);
        
        email__c listCodes = email__c.getInstance('test1');
        boolean EventStartDate=listCodes.emailsent__c;
        if(EventStartDate)
            Messaging.sendemail(new Messaging.singleEmailMessage[] {mail});
        
    }
 }