@RestResource(urlMapping='/InventivServices/IvrProcess/*')
global class restCheckActiveAvailability
{
    @HttpGet 
    global static void CheckActiveAvailabilityGet()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        system.debug('-------p'+req );
        String patientId= req .params.get('patientId');   
        String programID= req .params.get('programId');
        system.debug('-------'+   patientId+'------'+programID);
        res.addHeader('Content-Type', 'application/xml');
        string output=findResult(patientId,programID);
        res.responseBody = Blob.valueOf(output);
        system.debug('-------'+   res.responseBody);
       



     }
public static string findResult(string paid,String poid)
{
    string sResOutPut = '';
    string patientOutcome='prathap';
    sResOutPut = '<?xml version=\'1.0\' encoding=\'UTF-8\'?>';
    sResOutPut += '<result>';
    sResOutPut +='<patientOutcome>' + patientOutcome + '</patientOutcome>';
    sResOutPut +='</result>';
    Dom.Document domDoc = new Dom.Document();
    domDoc.load(sResOutPut);
    return sResOutPut; 

}

 }