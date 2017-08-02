/***************************************************************************
Name : OyeCode Api Service, custom designed in Apex 
Created By : Harshit Pandey (hpandey@salesforce.com)
Created Date : August 18, 2014
Description : An Apex REST service to that supports the following 
operations, related to insertion and retrieval of Contacts :

1. GET /ContactId - Return the Response as instance of custom class called ResponseClass
- Reponse class return customized information which is match Record, CustomMessage, Error (if any)

2. POST/Contact - Creates a new Contact and insert records in the database.

***************************************************************************/

@RestResource(urlMapping='/OyeCode1/*')
global class OyeCodeRestAPI1 {
    
    //**************************************************
    //Private methods 
    //**************************************************
    
    //Check if Object is NULL or Blank
    global static boolean isNotNullOrEmpty(string str)
    {
        return str!=null || !String.isBlank(str); 
    }
    
    // Create a Contact 
    public static Contact createContact(String firstName, String lastName, String email,String Phone)
    {
        //check if the fields provided on not empty
        if(isNotNullOrEmpty(firstName) && isNotNullOrEmpty(lastName) && isNotNullOrEmpty(email) && isNotNullOrEmpty(Phone))
        {
            Contact newContact = new Contact();
            newContact.FirstName = firstName;
            newContact.LastName = lastName;
            newContact.Email = email;
            newContact.Phone=phone;
            return newContact;         
        }
        else 
        {
            System.Debug('Required field values are not provided here');
            return null;
        }
    }
    
    public static Candidate__c createCandidate(String firstName, String lastName, String email,String Phone)
    {
        //check if the fields provided on not empty
        if(isNotNullOrEmpty(firstName) && isNotNullOrEmpty(lastName) && isNotNullOrEmpty(email) && isNotNullOrEmpty(Phone))
        {
            Candidate__c newContact = new Candidate__c();
            newContact.First_Name__c= firstName;
            newContact.Last_Name__c= lastName;
            newContact.Email__c= email;
            newContact.Mobile__c=phone;
            return newContact;         
        }
        else 
        {
            System.Debug('Required field values are not provided here');
            return null;
        }
    }
    

     @HttpPost
    global static ResponseHandler restCreateCandidate(String firstname, String  lastname, String email, String Phone)
    {
   
          Candidate__c newContact =  createCandidate(firstName, lastName, email, Phone);
        ResponseHandler response = new ResponseHandler();
        try
        {
            insert newContact;
            List<sObject> thesObjectList = new List<sObject>();
            thesObjectList.add((sObject)newContact);
            response.Data = thesObjectList;
            response.Status = 'Success';
            response.ErrorCode = null;
            response.Message = null;
        } 
        catch(DmlException e) 
        {
            //Add custom error code when you could not insert a record
            response.ErrorCode = 'Oyecode - 0001';
            response.Status = 'error';
            response.Message = e.getMessage();
        }
        return response;   
    }
    
    
    //====================================================================================
    // *** REST POST *** : Require field should not be empty, method to post a new Contact
    //====================================================================================
    
    
    //==============================================================================================
    // *** REST GET *** :  Requires the id of Contact and reutrn results as Response Type
    //===============================================================================================
    @HttpGet 
    global static ResponseHandler GET()
    {
        ResponseHandler response = new ResponseHandler();
        Contact  returnContact = getContact();
        
        if(returnContact!=null)
        {
            response.Status = 'Success';
            response.ErrorCode = '';
            List<sObject> thesObjectList = new List<sObject>();
            thesObjectList.add((sObject)returnContact);
            response.Data = thesObjectList;
            response.Message = 'Success : Found Contact';
        }
        
        else
        {
            response.ErrorCode = 'OyeCode-0002';
            response.Status = 'error';
            response.Message = 'Fail : Ahh, Contact Not Found';
            
        }
        
        return response;
    }
    
    //Adding custom Exception sub-class 
    public class NoRecordMatchException extends Exception {}
    
    public static Contact getContact()
    {
        //Read the Request from the URL
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        system.debug('------'+req.requestURI);
        String ContactId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); 
         system.debug('prathap------'+req.requestURI.substring(req.requestURI.lastIndexOf('/')+1));

        Contact result;
        try{
            result = [SELECT Id, lastname, firstName, phone, email FROM Contact WHERE Id = :ContactId];
        }
        Catch(System.QueryException e)
        {
            //Add custom exception dynamically to the ErrorMap
            throw new NoRecordMatchException('Unable to find the record maching Id : '+ContactId);
        }
        return result;
    }
    
}