public class readJSONArrays
{
           public class SuperClass
{
    public String someField1;
    public String someField2;
    public List <NestedClass> arrayOfRecords;
}

public class NestedClass
{
    public String someField3;
}

    public static void test()
    {
        String testJson = '{"someField1" : "testValue1", "someField2" : "testValue2", "arrayOfRecords" : [ { "someField3" : "testValue3" }, { "someField3" : "testValue4"}]}';

    SuperClass sc = (SuperClass)JSON.deserialize(testJson, SuperClass.class);
    system.debug('>>>>'+sc.someField1);
     list<NestedClass> pp=sc.arrayOfRecords;
     for(integer k=0;k<sc.arrayOfRecords.size();k++)
     {
          system.debug('>>>>sc.arrayOfRecords'+sc.arrayOfRecords[k].someField3);
     }
     
    }
}