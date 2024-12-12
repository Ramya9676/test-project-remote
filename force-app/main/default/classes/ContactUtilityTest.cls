@isTest
public class ContactUtilityTest {
    static testMethod void testGetContactsByAccountId() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        Contact con1 = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = acc.Id);
        Contact con2 = new Contact(FirstName = 'Jane', LastName = 'Smith', AccountId = acc.Id);
        insert new List<Contact>{con1, con2};
        
        List<Contact> contacts = ContactUtility.getContactsByAccountId(acc.Id);
        System.assertEquals(2, contacts.size());
    }
}