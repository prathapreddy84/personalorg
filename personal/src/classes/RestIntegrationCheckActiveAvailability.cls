@RestResource(urlMapping='/InventivServices/IvrProcess1/*')
global class RestIntegrationCheckActiveAvailability
{
    @HttpGet 
    global static string CheckActiveAvailabilityGet()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String companyName = req .params.get('patientId');   
        String programID= req .params.get('programId');
        system.debug('-------'+   companyName +'------'+programID);
        string s='hello';
       return s; 
    }

@HttpPost
global static string CheckActiveAvailabilityPost()
    {
             RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String companyName1 = req .params.get('patientId');   
        String programID2= req .params.get('programId');
system.debug('-------'+   companyName1 +'------'+programID2);
        string s='hello';
       return s; 
    }

}