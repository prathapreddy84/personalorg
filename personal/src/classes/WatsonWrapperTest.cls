@isTest
public class WatsonWrapperTest{ 

static testmethod void actionTest(){

String JSONContent = '{"text":{"lemmatized":"GOR","verb":"test"}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Action act = new WatsonWrapper.Action(parser);
Test.stopTest();
}

static testmethod void actionTest1(){

String JSONContent = '{"label":{"score":3.8,"confident":true}}'; 
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Taxonomy act2 = new WatsonWrapper.Taxonomy(parser);
Test.stopTest();
}

static testmethod void actionTest2(){

String JSONContent =  '{"text":{"sentiment":"GOR","relevance":4.6}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Keywords act1 = new WatsonWrapper.Keywords(parser);
Test.stopTest();
}

static testmethod void actionTest3(){

String JSONContent = '{"text":{"sentiment":"GOR","keywords":"java"}}'; 
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Object_Z act1 = new WatsonWrapper.Object_Z(parser);
Test.stopTest();
}

static testmethod void actionTest4(){

String JSONContent = '{"text":{"sentimentFromSubject":"GOR","keywords":"java"}}'; 
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Object_Y act1 = new WatsonWrapper.Object_Y(parser);
Test.stopTest();
}

static testmethod void actionTest5(){

String JSONContent = '{"text":{"sentimentFromSubject":"GOR","keywords":"java"}}'; 
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Object_X act1 = new WatsonWrapper.Object_X(parser);
Test.stopTest();
}

static testmethod void actionTest6(){

String JSONContent = '{"title":{"contentType":"GOR","severity":"java"}}'; 
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Metadata act1 = new WatsonWrapper.Metadata(parser);
Test.stopTest();
}

static testmethod void actionTest7(){

String JSONContent = '{"text":{"sentiment":"GOR"}}'; 
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Object_W act1 = new WatsonWrapper.Object_W(parser);
Test.stopTest();
}

static testmethod void actionTest8(){

String JSONContent = '{"text":{"sentiment":"GOR","keywords":"java","entities":"test"}}';  
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Object_V act1 = new WatsonWrapper.Object_V(parser);
Test.stopTest();
}

static testmethod void actionTest9(){

String JSONContent = '{"text":{"sentimentFromSubject":"GOR"}}'; 
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Object_U act1 = new WatsonWrapper.Object_U(parser);
Test.stopTest();
}

static testmethod void actionTest10(){

String JSONContent = '{"text":{"matching_results":2,"results":"abc"}}'; 
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Watson act1 = new WatsonWrapper.Watson(parser);
Test.stopTest();
}

static testmethod void actionTest11(){

String JSONContent = '{"text":{"lemmatized":"GOR","verb":"test"}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Action_Z act1 = new WatsonWrapper.Action_Z(parser);
Test.stopTest();
}

static testmethod void actionTest12(){

String JSONContent = '{"text":{"tense":"GOR"}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Verb act1 = new WatsonWrapper.Verb(parser);
Test.stopTest();
}

static testmethod void actionTest13(){

String JSONContent = '{"text":{"tense":"GOR","negated":"test"}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Verb_Z act1 = new WatsonWrapper.Verb_Z(parser);
Test.stopTest();
}

static testmethod void actionTest14(){

String JSONContent = '{"text":{"sentence":"GOR","subject":"test","action":"test","object":"test","location":"test"}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Relations act1 = new WatsonWrapper.Relations(parser);
Test.stopTest();
}

static testmethod void actionTest15(){

String JSONContent = '{"text":{"type":"GOR","mixed":true}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Sentiment_Z act1 = new WatsonWrapper.Sentiment_Z(parser);
Test.stopTest();
}

static testmethod void actionTest16(){

String JSONContent = '{"text":{"type":"GOR","score":5.6,"mixed":true}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Sentiment act1 = new WatsonWrapper.Sentiment(parser);
Test.stopTest();
}

static testmethod void actionTest17(){

String JSONContent = '{"text":{"type":"GOR","score":5.6,"mixed":true}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Subject act1 = new WatsonWrapper.Subject(parser);
Test.stopTest();
}

static testmethod void actionTest18(){

String JSONContent = '{"count":5,"score":5.6,"text":"ekk","relevance":9.6,"type":"ja"}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Entities act1 = new WatsonWrapper.Entities(parser);
Test.stopTest();
}

static testmethod void actionTest19(){

String JSONContent = '{"count":5,"score":5.6,"text":"ekk","relevance":9.6,"type":"ja"}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Entities_Z act1 = new WatsonWrapper.Entities_Z(parser);
Test.stopTest();
}

static testmethod void actionTest20(){

String JSONContent = '{"entities":"ent","taxonomy":"abc","docEmotions":"ekk","concepts":"ee","language":"english","status":"active","relations":"dis","keywords":"dis","docSentiment":"dis"}';

JSONParser parser = JSON.createParser(JSONContent);
String JSONContent1 = '{"taxonomy":"kodk"}';
JSONParser parser1 = JSON.createParser(JSONContent1);
Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Enriched_text act1 = new WatsonWrapper.Enriched_text(parser);
//WatsonWrapper.Enriched_text act2 = new WatsonWrapper.Enriched_text(parser1);
Test.stopTest();
}

static testmethod void actionTest21(){

String JSONContent = '{"text":{"opencyc":"ent","dbpedia":"abc","freebase":"ekk","relevance":3.3}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Concepts act1 = new WatsonWrapper.Concepts(parser);
Test.stopTest();
}

static testmethod void actionTest22(){

String JSONContent = '{"disgust":"ent","fear":"abc","anger":"ekk","joy":"ss","sadness":"english"}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.DocEmotions act1 = new WatsonWrapper.DocEmotions(parser);
Test.stopTest();
}

static testmethod void actionTest23(){

String JSONContent = '{"text":{"id":"ent","score":9.5,"metadata":"ekk","body":"ss","text":"english","enriched_text":"english"}}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Results act1 = new WatsonWrapper.Results(parser);
Test.stopTest();
}

static testmethod void actionTest24(){

String JSONContent = '{"text":"dde","keywords":"java"}';
JSONParser parser = JSON.createParser(JSONContent);

Test.startTest();
SubmitPayloadMock fakeRes = new SubmitPayloadMock(200,'Received','Received');
Test.setMock(HttpCalloutMock.class,fakeRes);
WatsonWrapper.Subject_Z act1 = new WatsonWrapper.Subject_Z(parser);
Test.stopTest();
}

static testmethod void actionTest25(){

String JSONContent = '{"text":{"keywords":"java"}}';

Test.startTest();
WatsonWrapper.parse(JSONContent);
Test.stopTest();
}


public class SubmitPayloadMock implements HttpCalloutMock{
    protected Integer code;
    protected String status;
    protected String bodyAsString;

    public SubmitPayloadMock(Integer code, String status, String body) {
    this.code = code;
    this.status = status;
    this.bodyAsString = body;
    }

    public HTTPResponse respond(HTTPRequest req) {
    HttpResponse resp = new HttpResponse();
    resp.setStatusCode(code);
    resp.setStatus(status);
    resp.setBody(bodyAsString);
    return resp;
    }
  }
}