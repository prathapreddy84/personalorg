global class mybatchschedule implements schedulable{
   global void execute(SchedulableContext sc){      
       mybatchcls obj=new mybatchcls();
       database.executebatch(obj,2);
   }
}