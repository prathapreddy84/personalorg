public class ACN_FilterController {
    
    @AuraEnabled
    public static List<string> getFilterOptions(Map<String,Object> pMapParams){
        List<string> lstFilterOptns = new List<string>();
        try{
            if (null!=pMapParams){
                System.debug('Params: ' + JSON.serialize(pMapParams));
                system.debug('>>>>>1');
                String strPassedProviderName = (String) pMapParams.get('strProviderName');
                system.debug('>>>>>2');
                String strProviderToUse = (!String.isBlank(strPassedProviderName))?strPassedProviderName:'ACN_FilterStandardStrategyImpl';
                system.debug('>>>>>3');
               
            }
        }catch(TypeException typeEx){
            throw new AuraHandledException('Passed provider name is Invalid. Cannot instantiate the provider.');
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
        return lstFilterOptns;
    }
    
  
}