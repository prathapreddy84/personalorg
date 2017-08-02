@istest(seealldata=false)
public class dynamicpickcls_test{
   
   public static testmethod void mytesttemp(){
       Account acct =new Account();
       acct.name='Test account Record';
       acct.phone='85985928';
       insert acct;
       
       contact cont=new contact();
       cont.lastname='Test Contact';
       cont.phone='29230592';
       cont.accountid=acct.id;
       insert cont;
       
       test.starttest();
           dynamicpickcls obj=new dynamicpickcls();
           obj.selact=acct.id;
           obj.addcontacts();
       test.stoptest();
   }
   public static testmethod void mytest2(){
       Account accttmp =new Account();
       accttmp.name='Test account Record';
       accttmp .phone='85985928';
       insert accttmp ;       
      
       
       test.starttest();
           dynamicpickcls objtmp=new dynamicpickcls();           
           objtmp.addcontacts();
       test.stoptest();
   }
}