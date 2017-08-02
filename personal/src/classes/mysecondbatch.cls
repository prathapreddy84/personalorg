global class mysecondbatch implements database.batchable<sobject>{
   global List<Opportunity> start(database.batchablecontext bc){
      string query='select id,name,amount,stagename,type from opportunity';
   return database.query(query);
   }
   global void execute(database.batchablecontext bc,List<opportunity> opptlst){
       for(opportunity opp:opptlst){
          if(opp.type!='New Customer'){
             opp.type='New Customer';
          }          
       }
       update opptlst;
   }
   global void finish(database.batchablecontext bc){
         mybatchcls obj=new mybatchcls();
         database.executebatch(obj,2);
   }
}