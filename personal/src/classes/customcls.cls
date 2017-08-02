public class customcls {
    public string acctname{get;set;}
    public string phone{get;set;}
    public string  city{get;set;}
    public customcls(){
    
    }
    public pagereference saverecord()
    {
      
       Account acct=new account();
       acct.name=acctname;
       acct.phone=phone;
       acct.billingcity=city;
       insert acct;
         pagereference obj=new pagereference('/'+acct.id);
     return obj;       

    }
}