public class first
{

   
public string name{get;set;}
    public first()
    {
    name='prathap';
    }
    public void show()
    {
    system.debug('>>>size');
    name='sailu';
    list<position__c> p=[select id from position__c];
    system.debug('>>>size'+p.size());
    
    }
}