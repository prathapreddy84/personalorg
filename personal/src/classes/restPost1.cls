@RestResource(urlMapping='/sample/sample1/*')
global class restPost1
{
@HttpPost
    global static void CheckActiveAvailabilityPost1()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        string output='Call the class';
        res.responseBody = Blob.valueOf(output);
        system.debug('-------'+   res.responseBody);

    }
    }