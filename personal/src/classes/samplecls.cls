public class samplecls{
  public List<studentinfo> stdlst{get;set;}
  
  public samplecls(){
     stdlst=new List<studentinfo>();
     studentinfo obj=new studentinfo(1,'Rajesh',10000,'SFDC Dev');    
     stdlst.add(obj);
     studentinfo obj1=new studentinfo(2,'Venki',10000,'SFDC Dev');    
     stdlst.add(obj1);
     system.debug('**********'+stdlst);
  }
  private class studentinfo{
    public integer rollnumb{get;set;}
    public string name{get;set;}
    public integer fees{get;set;}
    public string coursename{get;set;}
    
    public studentinfo(integer rln,string nm,integer fs,string crs){
         rollnumb=rln;
         name=nm;
         fees=fs;
         coursename=crs;
    }

}
}