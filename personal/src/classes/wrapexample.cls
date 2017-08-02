public class wrapexample {

    public String getAcclist() {
        return null;
    }


list<innercls>acclist{get;set;}
list<contact>conlist{get;set;}
public wrapexample(){
    acclist=new list<innercls>();
    for(contact cnct:[select id,lastname,phone from contact]){
        innercls obj=new innercls(cnct,false);
        acclist.add(obj);
    }
}
public class innercls{
  public contact con{get;set;}
  public boolean check{get;set;}
  public innercls(contact cn,boolean val){
      con=cn;
      check=val;
  }
}
}