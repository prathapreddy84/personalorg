@isTest(seeAllData=False)
private class OutSiderestApiCalling_Test{

  
  static testMethod void shouldBeAbleToGetData(){
  
    
    Test.setMock(HttpCalloutMock.class, new OutSiderestApiCallingCalloutMock());
    string res = OutSiderestApiCalling.test();
   
  }
}