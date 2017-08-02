public class myextensioncls {
    public account acct;
    public myextensioncls(apexpages.StandardController myvariabl) {
         acct=new account();
         system.debug('****'+myvariabl);
         acct=(Account)myvariabl.getrecord();
    }
    public pagereference saverecord(){
        
        insert acct;
        
        pagereference pgref=new pagereference('/apex/extensionpage');
        system.debug('---->'+acct);
        
        pgref.setredirect(true);
    return pgref;
    }
}