public class CustomApexPageController {
Apex_Page_Tab__c request;
private ApexPages.StandardController controller;
public Boolean displayPopup {get;set;}
public CustomApexPageController (ApexPages.StandardController controller)
 {
this.controller = controller;
 this.controller.addFields(new List<String> {'first_name__c','checkbox__c', 'LookUpRelation__c', 'picklist__c'});
 displayPopup =false;
//,'testObject_for_Apex_Pages__r'
//Apex_Page_Tab__c term = [Select Id, checkbox__c, first_name__c, LookUpRelation__c, picklist__c from Apex_Page_Tab__c  limit 1];

}
public void outputPanel()
{
displayPopup =!displayPopup ;
}
public PageReference saveAndCongrat() {

controller.save(); // This takes care of the details for you.
PageReference congratsPage = Page.test;

//congratsPage.setRedirect(true);

//return congratsPage;
return null;

}
}