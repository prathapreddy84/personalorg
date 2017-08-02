public with sharing class DataLoadTestingClass {
public String phoneVal { get; set; }
public String countryVal { get; set; }
public String cityVal { get; set; }
public String nameVal { get; set; }
public PageReference doInsert() {
Candidate__c objdlt = new Candidate__c();
objdlt.First_Name__c=nameVal;
objdlt.City__c=cityVal;
objdlt.Country__c=countryVal;
objdlt.Phone__c=phoneVal;
insert objdlt;
pagereference ref = new pagereference('/'+objdlt.id);
ref.setredirect(true);
return ref;
}
}