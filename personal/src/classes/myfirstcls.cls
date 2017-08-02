public class myfirstcls{
   public string name;
   public integer rollno;
   public boolean active;
  public myfirstcls(){
     integer i=10;
     integer j=20;
     integer k=i+j;
     system.debug('------->'+k);
  }
  public void mevoidmthod(){
      integer i=10;
      integer j=20;
      integer k=i+j;
      system.debug('----->'+k);
  }
  public integer nonvoidmethod(){
      integer i=10;
      integer j=20;
      integer k=i+j;
      system.debug('----->'+k);
  return k;
  }
  public integer calcl(integer i,integer j){
       integer k=i+j;
  return k;
  }
}