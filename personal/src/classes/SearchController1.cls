public class SearchController1 {

    public List<Account> accounts {get; set;}

    public SearchController1() {
        this.accounts = new List<Account>();
        checkCurrentPage();
    }
    public void checkCurrentPage() {
         system.debug('====check which page we are on===='+system.currentPageReference());
    }
    public void doSearch() {
        this.accounts = [select Id,Name from Account limit 200];
    }

    public PageReference doClick() {
        return Page.ViewPage2.setRedirect(false);
    }
}