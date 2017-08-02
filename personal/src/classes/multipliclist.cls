public class multipliclist
{
    public list<SelectOption> State {get; set;}
    public List<SelectOption> City {get; set;}
    public String SelectedState {get; set;}
     
    public multipliclist()
    {
        State = new List<SelectOption>() ;
        City = new List<SelectOption>() ;
        SelectedState = '' ;
         
        State.add(new SelectOption('Andhrapradesh', 'Andhrapradesh')) ;
        State.add(new SelectOption('Karnataka', 'Karnataka')) ;
        State.add(new SelectOption('Tamilnadu', 'Tamilnadu')) ;
    }
     
    public PageReference RelatedCity()
    {
        if(SelectedState == 'Andhrapradesh')
        {
            City = new List<SelectOption>() ;
            City.add(new SelectOption('Kurnool' , 'Kurnool')) ;
            City.add(new SelectOption('Hyderabad' , 'Hyderabad')) ;
            City.add(new SelectOption('Vizag' , 'Vizag')) ;
        }
        if(SelectedState == 'Karnataka')
        {
            City = new List<SelectOption>() ;
            City.add(new SelectOption('Bangalore' , 'Bangalore')) ;
            City.add(new SelectOption('Kolar' , 'Kolar')) ;
        }
        if(SelectedState == 'Tamilnadu')
        {
            City = new List<SelectOption>() ;
            City.add(new SelectOption('Chennai' , 'Chennai')) ;
            City.add(new SelectOption('Mysore' , 'Mysore')) ;
        }
        return null ;
    }
}