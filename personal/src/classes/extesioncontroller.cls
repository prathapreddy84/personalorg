public class extesioncontroller {
    public Position__c p{ get; set; }
    public extesioncontroller(ApexPages.StandardController controller) {
        this.p= (Position__c )controller.getRecord();
        string posid=ApexPages.currentPage().getParameters().get('id');
        if(string.isnotblank(posid))
           p=[select id,name,status__c from Position__c where id=:posid];

    }

}