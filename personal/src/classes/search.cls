public class search {
    public string name{set;get;}
    public search(){
    
    }
    public void save(){
        string a='Jespersen123';
        string s='select id,First_Name__c from Integration__c where First_Name__c=\'' + name + '\'' ;

        system.debug('>>>'+s);
        list<Integration__c> lis= database.query(s);
        system.debug('>>>lis'+lis);
    }
}