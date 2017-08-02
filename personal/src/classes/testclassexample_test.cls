@istest
public class testclassexample_test{
    public static testmethod void m1(){
        user u=[select id from user where id='00528000000FRhf'];
        system.debug('>>>>>UserInfo.getName()'+UserInfo.getName());
        system.runas(u){
            system.debug('>>>>>123UserInfo.getName()'+UserInfo.getName());
            account a1=new account();
            a1.name='TEst';
            insert a1;
            
             account a2=new account();
            a2.name='TEst';
            insert a2;
            testclassexample a=new testclassexample();
            a.test1(a1.id);
        }
    }
}