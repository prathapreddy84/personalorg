public class ListOfRecords
{
public Boolean showRecords{get;set;}
public List<Candidate__c> cust {get;set;}
//In constructor<BR>BR>
public ListOfRecords()
{
showRecords =true;
}
public void fetchRecords()
{
cust = [Select First_Name__c, Last_Name__c from Candidate__c limit 1000];// you need to place a limit of 1000 as VF supports max of 1000 recors to be displayed<BR>
showRecords = true;
}

}