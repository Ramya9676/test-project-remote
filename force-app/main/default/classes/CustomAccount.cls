public class CustomAccount {
    private String Id;
    private String name;
    private Double revenue;
    
    public CustomAccount() {
    }
    
    public void setId(String id) {
        this.Id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public Double getRevenue() {
        return revenue;
    }
    
    public void setRevenue(Double revenue) {
        this.revenue = revenue;
    }
    
   
    public List<CustomAccount> getAccountsByRevenue(Double revenue) {
        List<CustomAccount> accounts = new List<CustomAccount>();
        
        return accounts;
    }
}