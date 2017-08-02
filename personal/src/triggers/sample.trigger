trigger sample on SEZ_Demo__c (before insert,after update) {
    if(trigger.isinsert){
      sampletriggerhandler a=new sampletriggerhandler();
      a.test(trigger.new);
    }
    
    if(trigger.isupdate){
        set<id> parentids=new set<id>();
        list<sez_demo_1__c> listchld=new list<sez_demo_1__c>();
        for(SEZ_Demo__c  a:trigger.new){
            sez_demo_1__c p=new sez_demo_1__c();
            p.first_name__c='PRathap TechM';
            p.SEZ_Demo__c=a.id;
            listchld.add(p);
            parentids.add(a.id);
            system.debug('>>>>>'+a.id);
         
        }
       insert listchld;
       //list<SEZ_Demo__c > ppp=[select id from SEZ_Demo__c where id in:parentids];
    }
}