trigger ExpenseTrigger on Expense__c (after insert, after update) {
    // Loop through the records and call the ExpenseHelper method
    for (Expense__c expense : Trigger.new) {
        // Only call the method if the record has been created or updated
        ExpenseHelper.notifyIfHighExpense(expense);
    }
}