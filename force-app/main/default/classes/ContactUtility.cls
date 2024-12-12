public class ContactUtility {
    public static List<Contact> getContactsByAccountId(Id accountId) {
        return [SELECT Id, FirstName, LastName FROM Contact WHERE AccountId = :accountId];
    }
}