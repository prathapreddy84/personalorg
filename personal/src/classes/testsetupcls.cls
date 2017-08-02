@istest
public class testsetupcls{

  @testSetup 
  public static void mysetupmethod() {
        Account acct=new account(name='Test account',phone='5433212');
        insert acct;
  }
}