public class repeat {
    public list<account> opplst{get;set;}
    public String getOpplst()
    {
        return null;
    }
    public repeat() {
        opplst=[select id,name from account limit 100];
    }

}