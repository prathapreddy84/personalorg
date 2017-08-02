public class six
{
public list<selectoption> options{get;set;}
public string objName{get;set;}
public list<selectoption> Filedsoptions{get;set;}
map<string,schema.sobjecttype> m;
public list<selectoption> getoptions()
{
return options;
}
public six()
{
options =new list<selectoption>();
Filedsoptions =new list<selectoption>();
m=schema.getglobaldescribe();
set<string> obj=m.keyset();
for(string s:obj)
{
if(m.get(s).getdescribe().iscustom())
{
selectoption op=new selectoption(s,s);
options.add(op);
}
}
}
public pagereference show()
{
Filedsoptions.clear();

system.debug('------------'+objName);
SObjectType accountType = m.get(objName);

map<string,schema.sobjectField> m1=accountType.getDescribe().fields.getMap();

for (Schema.SObjectField field : accountType.getDescribe().fields.getMap().values())
{
String line = field.getDescribe().getName() ;
system.debug('--------hhe----'+line);
selectoption op=new selectoption(line,line);
Filedsoptions.add(op);

}
return null;
}
}