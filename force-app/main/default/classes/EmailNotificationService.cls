public with sharing class EmailNotificationService {
    public static void sendEmailNotification(Task taskRecord) {
        if (taskRecord.Priority == 'High' && taskRecord.Status == 'Not Started') {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[]{'recipient@example.com'});
            mail.setSubject('High Priority Task Created');
            mail.setPlainTextBody('A high priority task titled "' + taskRecord.Subject + '" has been created.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        }
    }
}