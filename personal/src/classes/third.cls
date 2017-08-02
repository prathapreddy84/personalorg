public class third
{
public string[] names{set;get;}
public selectoption[] option{set;get;}
public string name{set;get;}
public List<string> stud{get;set;}
public third()
{
name='prathap';
names=new string[]{'ram','shiva','sailu'};
selectoption op1=new selectoption('null','-none-');
selectoption op2=new selectoption('one','jan');
selectoption op3=new selectoption('two','feb');
option=new selectoption[]{op1,op2,op3};
stud=new List<string>();
stud.add('prathap');
stud.add('sailu');
stud.add('praveen');
}
}