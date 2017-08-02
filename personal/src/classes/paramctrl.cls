public class paramctrl {
public string userName{get;set;}
public string userPassword{get;set;}
public void display(){
    system.debug('>>>>>userName'+userName);
    system.debug('>>>>>userPassword'+userPassword);
}
}