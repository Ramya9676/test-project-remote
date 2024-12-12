@isTest
private class EmailNotificationServiceTest {
    @isTest
    static void testSendEmailNotification() {
        Task task = new Task(Subject = 'Urgent Task', Priority = 'High', Status = 'Not Started');
        insert task;

        Test.startTest();
        EmailNotificationService.sendEmailNotification(task);
        Test.stopTest();

        // Verify email sent (use limits to verify number of emails sent)
        System.assertEquals(1, Limits.getEmailInvocations(), 'An email should be sent.');
    }
}