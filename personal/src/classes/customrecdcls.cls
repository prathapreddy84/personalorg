public with sharing class customrecdcls {
   public account acct{get;set;}
   public customrecdcls (){
       acct=new account();
   }
   public pagereference saverecd(){
        insert acct;
        pagereference pgref=new pagereference('/apex/customclspage');
        pgref.setredirect(true);
        
   return pgref;
   
   }
}