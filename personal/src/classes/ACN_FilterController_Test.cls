@isTest
public class ACN_FilterController_Test {
    static testMethod void Test1(){
        test.startTest();
        //ACN_FilterController acn = new ACN_FilterController();
        Map<String,Object> pMapParams = new Map<String,Object>();
        string strProviderName='strProviderName';
        object b=(object )strProviderName;
        pMapParams.put('strProviderName',b);
        ACN_FilterController.getFilterOptions(pMapParams);
       
        test.stopTest();
       
     }
    
}