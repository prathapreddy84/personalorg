public class xyz {

    public void savemethod() {
       position__c p=new position__c();
       p.name=name;
       p.Java__c=status;
       p.Location__c=company;
       insert p;
       system.debug('>>>>');
    }

public string name{get;set;}
public string  company{get;set;}
public boolean status{get;set;}


}