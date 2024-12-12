@isTest
public class TaskServiceTest {

    // Test method to create a Task
    @isTest
    static void testCreateTask() {
        String taskSubject = 'Follow up with customer';
        Date taskDueDate = Date.today().addDays(7);
        
        // Call the createTask method
        Task createdTask = TaskService.createTask(taskSubject, taskDueDate);
        
        // Assert that the Task was created successfully
        System.assertNotEquals(createdTask, null, 'Task should be created');
        System.assertEquals(createdTask.Subject, taskSubject, 'Task subject should match');
        System.assertEquals(createdTask.ActivityDate, taskDueDate, 'Task due date should match');
    }
    
    // Test method to update a Task's status
    @isTest
    static void testUpdateTaskStatus() {
        // Create a Task record
        Task newTask = new Task(Subject = 'Prepare monthly report', ActivityDate = Date.today().addDays(5));
        insert newTask;
        
        // Update the task's status
        String newStatus = 'Completed';
        Task updatedTask = TaskService.updateTaskStatus(newTask.Id, newStatus);
        
        // Assert that the task status was updated
        System.assertEquals(updatedTask.Status, newStatus, 'Task status should be updated');
    }
}