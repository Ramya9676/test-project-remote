public class TaskHelper {
    public static void sendOverdueNotification(Task__c task) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[] {task.Assigned_To__r.Email});
        email.setSubject('Task Overdue: ' + task.Name);
        email.setPlainTextBody('Your task "' + task.Name + '" is overdue.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        //For testing commit 
    }
}