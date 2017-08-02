@RestResource(urlMapping='/InventivServices/IvrProcess/DetermineRefillOutcomeGet/*')
global class restDetermineRefillOutcome
{
    @HttpGet 
    global static string DetermineRefillOutcomeGet()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String patientId= req .params.get('patientId');   
        String programID= req .params.get('programId');
       String productId= req .params.get('productId');
        String isNextRefill= req .params.get('isNextRefill');
        system.debug('-------'+   patientId+'------'+programID+'-----'+productId+'-------'+isNextRefill);
        string s='hello';
       return s; 
    }

}