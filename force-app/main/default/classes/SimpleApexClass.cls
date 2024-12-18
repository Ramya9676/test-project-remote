public class SimpleApexClass {

    // ... (other methods)

    public List<Account> getTopAccounts(Integer dynamicLimit) {
        String query = 'SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT :dynamicLimit';
        return Database.query(query);
    }
}