public class customlistcls {
   public List<Account> acctlst{get;set;}
   public customlistcls(){
      acctlst=new List<Account>();
      acctlst=[select id,name,billingcity,phone from account order by name asc limit 500 ];
   }
}