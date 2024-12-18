public class TaskService {
  // Method to create a Task record
    public static Task createTask(String subject, Date dueDate) {
        Task newTask = new Task();
        newTask.Subject = subject;
        newTask.ActivityDate = dueDate;  // ActivityDate is the due date of the task
        insert newTask;
        return newTask;
    }
    
    // Method to update a Task's Status
    public static Task updateTaskStatus(Id taskId, String newStatus) {
        Task taskToUpdate = [SELECT Id, Status FROM Task WHERE Id = :taskId LIMIT 1];
        taskToUpdate.Status = newStatus;
        update taskToUpdate;
        return taskToUpdate;
    }
}