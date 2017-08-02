global class CreateAccountEmailServiceExample implements Messaging.InboundEmailHandler
 {
global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope envelop){
Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
String accname = email.fromName;
String accdes = email.plainTextBody;
String accIndus = email.Subject;
Candidate__c ac = new Candidate__c(First_Name__c= accname);
insert ac;
return null;
}
}