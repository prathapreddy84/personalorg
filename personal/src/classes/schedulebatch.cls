global class schedulebatch implements schedulable{
   global void execute(SchedulableContext sc){
   
        mysecondbatch obj=new mysecondbatch();
        Id jobid=database.executebatch(obj,1);
   }
}