public class CampaignPopup {
    public Blob csvFileBody{get;set;}
    public string csvAsString{get;set;}
    
    public Document document {
    get {
      if (document == null)
        document = new Document();
      return document;
    }
    set;
  }
  public static String blobToString(Blob input, String inCharset){
    String hex = EncodingUtil.convertToHex(input);
    System.assertEquals(0, hex.length() & 1);
    final Integer bytesCount = hex.length() >> 1;
    String[] bytes = new String[bytesCount];
    for(Integer i = 0; i < bytesCount; ++i)
        bytes[i] =  hex.mid(i << 1, 2);
    return EncodingUtil.urlDecode('%' + String.join(bytes, '%'), inCharset);
}
  public void upload() {
 
    document.AuthorId = UserInfo.getUserId();
    document.FolderId = '00528000000FEDb'; 
  //  csvAsString = document.body.toString();
    csvAsString =csvFileBody.toString();
    //csvAsString =blobToString(csvFileBody,'');
   // csvAsString  = EncodingUtil.base64Encode(csvFileBody);
    system.debug('>>>>>>112'+csvAsString.length()); 
     system.debug('>>>>>>111'+csvAsString); 
    String csvBody = EncodingUtil.base64Encode(csvFileBody);
    system.debug('>>>>>>csvBody '+csvBody ); 

    String[] csvFileLines = csvAsString.split('\n'); 
    for(Integer i=1;i<csvFileLines.size();i++){
        string[] csvRecordData = csvFileLines[i].split(',');
        for(string a:csvRecordData)
        {
            system.debug('>>>>>>'+a);
        }
    }
   // insert document;
   
}
}