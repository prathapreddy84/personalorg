public class ActionCTRL {
public customer__c cust{get;set;}
public integer counter{get;set;}
public ActionCTRL(){
cust=new customer__c();
counter=0;
}
public void save(){
system.debug('>>>>>>');

    insert cust;
}
public void actionpollarsample(){
counter++;
}

}