public class studentinfo{
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