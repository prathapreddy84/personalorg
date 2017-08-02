public class picklist {
public list<Job_Application__c > jb{set;get;}

    public PageReference show() {
    system.debug('>>>>'+selected);
        boolean status;
        if(selected=='Active')
            status=true;
        else
            status=false;
        jb=[select id,name from Job_Application__c where active__c=:status];
        return null;
    }

public list<selectoption>options{set;get;}
    public string selected{set;get;}
    Public picklist(){
     list<Job_Application__c > jb=new list<Job_Application__c >();
        options=new list<selectoption>();
        list<string>pick=new list<string>{'Active','InActive'};
            for(string p:Pick){
                selectoption op=new selectoption (p,p);
                options.add(op);
            }
    }

}