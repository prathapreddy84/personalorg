public class soapInkove
{
    public static void testpatener()
    {
        DemoPatner2.Soap a=new DemoPatner2.Soap();
        DemoPatner2.LoginResult  lr=a.login('admin.sandeep@sandeeptech.com','sandeepsfdc9');
        system.debug('>>>>'+lr);
          a.endpoint_x = lr.serverUrl;
     a.sessionHeader = new DemoPatner2.SessionHeader_element();
    a.sessionHeader.sessionid = lr.sessionId;
     
     DemoPatner2.QueryResult qresult = a.query('SELECT id FROM account');
      system.debug('>>>>>'+qresult );
       
     Demopatner3.sObject_x[] s1 = qresult.records;
     for (integer i = 0; i < s1.size(); i++)
     {
         //Contact con = (Contact) s1[i];
    
       // account accType = s1[i].GetType();
        system.debug('>>>>>123'+s1[i].id);
     
        
    }
    Demopatner3.sObject_x contact = new Demopatner3.sObject_x();
     contact.type_x='ObjectA__c';
     Demopatner3.sObject_x contact1 = new Demopatner3.sObject_x();
     contact1.type_x='ObjectA__c';

     Demopatner3.sObject_x[] contacts = new  Demopatner3.sObject_x[2];
    contacts[0] = contact;
     contacts[1] = contact1;
    
        
     a.create(contacts);
    }
}