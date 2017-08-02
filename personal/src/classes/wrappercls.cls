public class wrappercls {
  public List<innercls> contlst{get;set;}
  public wrappercls(){
     contlst=new List<innercls>();
     for(Contact cont:[select id,lastname,firstname,phone,mailingcity from contact]){
         innercls obj=new innercls(cont,false);
         contlst.add(obj);
     }
     system.debug('*********constructor***'+contlst);
  }
  public pagereference processrecords(){      
          List<contact> templst=new List<contact>();
      for(innercls temp:contlst){
         
         if(temp.check==true){
            templst.add(temp.conrecd);
         }
      }
      if(templst.size()>0){
         //try{
            delete templst;
            //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, 'Record Deleted'));
           pagereference  pgref=new pagereference('/apex/wrapperexample');
           pgref.setredirect(true);
            return pgref;
         //}
        /* catch(exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, e.getmessage()));
         }*/
         
      }
      
      
  return null;
  }
/*  @testvisible
  private void myprivatemethod(){
      system.debug('sklsdjfkds');
    }*/
  
  
  public class innercls{
     public contact conrecd{get;set;}
     public boolean check{get;set;}
     public innercls(contact cnt,boolean val){
        conrecd=cnt;
        check=val;
     }
  
  }
}