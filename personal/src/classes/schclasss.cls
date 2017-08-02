global class schclasss implements schedulable{
    global void execute(schedulablecontext sc){
        examplebatch bt=new examplebatch();
        database.executeBatch(bt,10);
    }
}