public class dynamicpicklstcls {
   public List<selectoption> picklstvals{get;set;}
   public boolean display{get;set;}
   public string seleval{get;set;}
   public dynamicpicklstcls(){
    
       picklstvals=new List<selectoption>();
        
       selectoption obj=new selectoption('India','Ind');
       picklstvals.add(obj);
       
       selectoption obj1=new selectoption('Germany','Germ');
       picklstvals.add(obj1);
       
       selectoption obj2=new selectoption('Italy','Ity');
       picklstvals.add(obj2);
       
       picklstvals.add(new selectoption('Pakistan','Pak'));
       display=false;
   }
  public void actionmethod(){
     display=true;
  }
  }