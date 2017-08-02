public class position 
{
      public list<Position__c> positions{set;get;}
      
      public List<Position__c> emplist { set; get;}
 
    public String recordId { set; get; }
    
    public position(){
        emplist = [SELECT Id, Name  FROM Position__c];
        
    }


    public void getValue(){
     System.debug('*************Record Id ***'+recordId);
    
    }


}