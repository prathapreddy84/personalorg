trigger restCallouts on trigerrCallouts__c (before insert) 
{
    restApiCalling1.test();
}