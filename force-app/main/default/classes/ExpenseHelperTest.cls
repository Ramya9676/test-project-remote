@isTest
public class ExpenseHelperTest {
    @isTest
    static void testNotifyIfHighExpense() {
        Expense__c testExpense = new Expense__c(Amount__c = 1500);
        insert testExpense;
        
        Test.startTest();
        ExpenseHelper.notifyIfHighExpense(testExpense);
        Test.stopTest();
        
        // Add assertions if needed
    }
}