@istest
public class customcls_test{
   public static testmethod void mytest(){
      
      test.starttest();
          customcls obj=new customcls();
          obj.acctname='test record';
          obj.phone='464536232';
          obj.city='Hyderabad';
          obj.saverecord();
          account acct=new Account();
          acct=[select id,name,phone from account where name='test record' and billingcity='Hyderabad' limit 1];
          system.assert(acct.phone=='464536232');
      test.stoptest();
   }
}