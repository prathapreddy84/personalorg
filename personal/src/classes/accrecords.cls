public class accrecords {

Public List<account> acclist{get;set;}
public string openerObjField {get;set;}
    public accrecords(ApexPages.StandardController controller) {
    acclist =[select id,name from account limit 10];
    openerObjField = ApexPages.currentPage().getParameters().get('obj');
//test123
    }
}
