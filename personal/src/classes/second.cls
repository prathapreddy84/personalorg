public class second
{

public integer bvalue{get;set;}
public integer avalue{get;set;}
public integer result{get;set;}
public string operation{get;set;}
public pagereference subb()
{
result=avalue-bvalue;
operation='SUBTRACTION';
return null;
}
public pagereference ADD()
{
result=avalue-bvalue;
operation='ADDITION';
return null;
}
}