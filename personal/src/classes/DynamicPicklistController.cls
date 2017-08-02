public class DynamicPicklistController {

    public string newPicklistValue {get;set;}
    
    public void addPicklistValue() {
        
        MetadataService.CustomField customField = getPicklist();
        addPicklistValue(customField,newPicklistValue);
        
    }
    
    public List<SelectOption> picklistValues {
        get;
        set;
    }
    
    public List<string> stringPicklistValues { get;set;}
    
    public void deletePicklistValue()
    {
        MetadataService.CustomField customField = getPicklist();
        deletePicklistValue(customField,selectedPicklistValue);
    }
    
    public string selectedPicklistValue { get;set; }
    
    public DynamicPicklistController() {
    
        MetadataService.CustomField field =getPicklist();
        refreshFields(field);
    }
    
    private void refreshFields(MetadataService.CustomField field) {

        picklistValues = new List<SelectOption>();
        stringPicklistValues = getPicklistValuesFromCustomField(field);
        
        for(string v : stringPicklistValues)
        {
            picklistValues.add( new SelectOption(v,v));
        }
    }
    
    //Picklist name - entity.field
    private static string PicklistFieldName = 'Account.Active__c';
    
    private static MetadataService.CustomField getPicklist()
    {
        // Create service
        MetadataService.MetadataPort service = createService();

        // Read Custom Field (picklist)
        MetadataService.CustomField customField = (MetadataService.CustomField) service.readMetadata(
            'CustomField', new String[] { PicklistFieldName }
        ).getRecords()[0];
        
        return customField;

    }

    private static List<string> getPicklistValuesFromCustomField(MetadataService.CustomField customField) {
        
        List<string> retVal = new List<string>();
system.debug('>>>>>');
        for ( MetadataService.PicklistValue picklistValue : customField.picklist.picklistValues ) {
        system.debug('>>>>>'+picklistValue.fullName);
            retVal.add(picklistValue.fullName);
            
        }
        
        return retVal;
    }
    
    private void addPicklistValue(MetadataService.CustomField customField, string picklistValue) {
        
        MetadataService.MetadataPort service = createService();
        
        metadataservice.PicklistValue newPicklistvalue = new metadataservice.PicklistValue();
        newPicklistvalue.fullName= picklistValue;
        newPicklistvalue.default_x = false;
        
        customField.picklist.picklistValues.add(newPicklistvalue);
        
        List<MetadataService.SaveResult> results = service.updateMetadata(new List<MetadataService.Metadata> {customField });
        
        refreshFields(customField);
    }
    
    private void deletePicklistValue(MetadataService.CustomField customField, string picklistValue) {
        
        MetadataService.MetadataPort service = createService();
        for(integer i = 0; i < customField.picklist.picklistValues.size(); i++) {
            MetadataService.PicklistValue pv = customField.picklist.picklistValues[i];
            if(pv.fullName == picklistValue )
            {
                customField.picklist.picklistValues.remove(i);
                break;
            }
        }

        List<MetadataService.SaveResult> results = service.updateMetadata(new List<MetadataService.Metadata> {customField });
        
        refreshFields(customField);
    }
    
    private static MetadataService.MetadataPort createService()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;    
    }
    
}