public class quable1 implements queueable{
    public void execute(queueablecontext qc){
        system.debug('>>>>>>');
        system.debug('>>>>>>11');
        system.debug('>>>>>>144');
        quable2 q2=new quable2();
        system.enqueueJob(q2);
        
    }
}