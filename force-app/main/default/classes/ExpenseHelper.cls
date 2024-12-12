public class ExpenseHelper {
    public static void notifyIfHighExpense(Expense__c expense) {
        if (expense.Amount__c > 1000) {
            // Retrieve the custom label value
            String notificationMessage = Label.Expense_Notification;
            
            // Logic to send email or other notification
            System.debug('Notification: ' + notificationMessage);
            
            // Example of using the label in an email notification or other alert
            // Send email or display the notification
        }
    }
}