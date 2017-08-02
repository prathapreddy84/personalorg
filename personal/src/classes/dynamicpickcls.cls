public class dynamicpickcls {
    public List<selectoption> acctlst{get;set;}
    public List<selectoption> contlst{get;set;}
    public string selact{get;set;}
    public boolean display{get;set;}
    public dynamicpickcls(){
        
        acctlst=new List<selectoption>();
        contlst=new List<selectoption>();
        for(Account acct:[select id,name from account order by name asc]){
           acctlst.add(new selectoption(acct.id,acct.name));
        }
         display=true;
    }
    public void addcontacts(){
       contlst.clear();
       for(contact cont:[select id,name from contact where accountid=:selact order by name asc]){
          contlst.add(new selectoption(cont.id,cont.name));
       }
       if(contlst.size()>0){
         display=true;
       }
       else{
           display=false;
       }
    }
}