public class JSONSerializeDeserialize
{
    public static void test()
    {
    
        list<Integration__c> listIntegration =new list<Integration__c>();
        Integration__c a=new Integration__c();
         a.name='3';
        a.First_Name__c='test';
        a.Last_Name__c='test1';
        a.location__c='test2';
        a.CITY__c='test3';
        a.state__c='test4';
        a.street__c='test5';
    // insert a;
        listIntegration.add(a);
        
        a=new Integration__c();
        a.name='4';
        a.First_Name__c='sample';
        a.Last_Name__c='sample1';
        a.location__c='sample2';
        a.CITY__c='sample3';
        a.state__c='sample4';
        a.street__c='sample5';
        
      // insert a;
        listIntegration.add(a);
        
        String JSONString = JSON.serialize(listIntegration);
        system.debug('>>>>JSONString '+JSONString );
        
        
        List<Integration__c> deserializedInvoices = (List<Integration__c>)JSON.deserialize(JSONString, List<Integration__c>.class);
       /* for(Integration__c aaa:deserializedInvoices )
        {
            aaa.id=null;
        }*/
    //    insert listIntegration;
        insert deserializedInvoices ;


    }
}