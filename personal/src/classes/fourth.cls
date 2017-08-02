public class fourth
{
public map<string,string> inputfileds{get;set;}
public list<selectoption> conuntries{get;set;} 
public string[] conuntries1 =new string[]{};
public fourth()
{
inputfileds=new map<string,string>();
inputfileds.put('firstName','prathap');
inputfileds.put('SecondName','Reddy');
inputfileds.put('age','32');
conuntries=new list<selectoption>();
conuntries.add(new selectoption('us','us'));
conuntries.add(new selectoption('canada','can'));

}
public pagereference show1()
{
messaging.singleemailmessage msg=new messaging.singleemailmessage();
string[] toadd=new string[]{'spprathap2003@gail.com','ps0070551@techahindra.com'};
msg.setToaddresses(toadd);
msg.setsubject('hello');
msg.setplaintextbody('hi Prathap');
msg.sethtmlbody('<h1>hello</h1>');
messaging.sendemail(new messaging.singleemailmessage[]{msg});
return null;
}
 public static void createcandidate(String firstName, String lastName, String email,String Phone)
    {
        //check if the fields provided on not empty
        
            Candidate__c newContact = new Candidate__c();
            newContact.First_Name__c= firstName;
            newContact.Last_Name__c= lastName;
            newContact.Email__c= email;
            newContact.Phone__c=phone;
                
        
        }
public pagereference show()
{
display();
return null;
}
public void display()
{
inputfileds.put('age',(integer.valueof(inputfileds.get('age'))+10).format());
}
}