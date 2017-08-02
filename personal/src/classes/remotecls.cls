public with sharing class remotecls {
    
    public string recid{get; set;}
    
      
    
    @RemoteAction
    public static string query(string recId){
        account acc = [Select id, name from Account where id=:recid];
        return acc.Name;    
    }
    
    
}