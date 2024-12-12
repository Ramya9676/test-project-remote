@isTest
public class TaskTriggerTest {
    @isTest
    static void testOverdueTask() {
        // Create a test user
        User testUser = [SELECT Id, Email FROM User LIMIT 1];
        
        // Create a Task record
        Task__c testTask = new Task__c(
            Name = 'Test Task',
            Assigned_To__c = testUser.Id,
            Due_Date__c = Date.today().addDays(-1),
            Status__c = 'Not Started'
        );
        insert testTask;

        // Query and assert the changes made by the trigger
        Task__c updatedTask = [SELECT Status__c FROM Task__c WHERE Id = :testTask.Id];
        System.assertEquals('Overdue', updatedTask.Status__c);
        //Test EZ commit
    }
}