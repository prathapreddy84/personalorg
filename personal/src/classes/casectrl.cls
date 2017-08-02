public class casectrl {
    public list<case> cases1{get;set;}
    public Boolean bRenderThePanel{get;set;}
    public casectrl(ApexPages.StandardController controller) {
        cases1=[select id,casenumber,account.name,contact.name,subject,Status,owner.name from case];
        bRenderThePanel=false;
    }
    public void DoSomeCalcs(){
        bRenderThePanel=true;
    }

}