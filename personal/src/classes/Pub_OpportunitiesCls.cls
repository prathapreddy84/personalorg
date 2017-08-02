global class Pub_OpportunitiesCls
{
webservice static void disp()
{

system.debug('--------------------Prathap');
Job_Application__c t=new Job_Application__c();
system.debug('--------------------Prathap1');
insert t;
system.debug('--------------------Prathap2');
Integration__c tt=new Integration__c();
insert tt;
system.debug('--------------------Prathap3');
}
}