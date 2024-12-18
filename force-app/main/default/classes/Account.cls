public class Account {
    public String Id;
    public String name;
    public Double AnnualRevenue;
    
    public Account() { 
    //Changes by developer 1 on the same apex class
    
    
    }
    
    public void setID(String id) {
        this.Id = id; 
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String n) {
        this.name = n;
    }
 
    public Double getAnnualRevenue() {
        return AnnualRevenue;
    }
    
    public void setAnnualRevenue(Double r) {
        this.AnnualRevenue = r;
    }
    
    public List<Account> getAccountsByRevenue(Double AnnualRevenue) {
        List<Account> accounts = new List<Account>();
       
        return accounts;
    }
    public List<Account> getAccountsByContact(double Contact){
        List<Account> accounts = new List<Account>();
        return accounts;
    }
    public List<Contact> getContactsByRevenue(Double AnnualRevenue){
        List<Contact> contacts = new List<Contact>();
        return contacts;
    }
}