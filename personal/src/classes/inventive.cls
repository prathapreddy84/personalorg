public class inventive
{
  public String AddressLine1{ get; set; }
  public String AddressLine2{ get; set; }
  public String City{ get; set; }
  public String State{ get; set; }
  public String Zip{ get; set; }
   public String MailingAddressLine1{ get; set; }
  public String MailingAddressLine2{ get; set; }
  public String MailingCity{ get; set; }
  public String MailingState{ get; set; }
  public String MailingZip{ get; set; }
public void save()
{

}

public void AddAddress()
{
system.debug('---');
AddressLine1= Apexpages.currentPage().getParameters().get('address1');
AddressLine2= Apexpages.currentPage().getParameters().get('address2');
City= Apexpages.currentPage().getParameters().get('city');
State= Apexpages.currentPage().getParameters().get('state');
Zip= Apexpages.currentPage().getParameters().get('zip');
system.debug('---'+AddressLine1+'---'+AddressLine2+'---'+City+'---'+State+'---'+Zip);

}
public void MailingAddAddress()
{

MailingAddressLine1= Apexpages.currentPage().getParameters().get('address1');
MailingAddressLine2= Apexpages.currentPage().getParameters().get('address2');
MailingCity= Apexpages.currentPage().getParameters().get('city');
MailingState= Apexpages.currentPage().getParameters().get('state');
MailingZip= Apexpages.currentPage().getParameters().get('zip');
system.debug('---'+MailingAddressLine1+'---'+MailingAddressLine2+'---'+MailingCity+'---'+MailingState+'---'+MailingZip);

}
}