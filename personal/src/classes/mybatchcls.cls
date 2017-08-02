global class mybatchcls implements database.batchable<sobject>{

  global List<sobject> start(Database.batchablecontext bc){
  
  return [select id,name,phone from contact];
  }
  global void execute(database.batchablecontext bc,List<contact> conlst){
  
     for(contact con:conlst){
        con.phone='88888888';
     }
     update conlst;
  }
  global void finish(database.batchablecontext bc){
  
  }
}