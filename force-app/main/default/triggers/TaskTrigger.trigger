trigger TaskTrigger on Task__c (after insert, after update) {
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    Date today = Date.today();

    for (Task__c task : Trigger.new) {
        if (task.Status__c != 'Completed' && task.Due_Date__c < today && task.Status__c != 'Overdue') {
            task.Status__c = 'Overdue';
            
            // Send email notification
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {task.Assigned_To__r.Email});
            email.setSubject('Task Overdue: ' + task.Name);
            email.setPlainTextBody('Your task "' + task.Name + '" is overdue.');
            emails.add(email);
        }
    }
    if (!emails.isEmpty()) {
        Messaging.sendEmail(emails);
    }
}