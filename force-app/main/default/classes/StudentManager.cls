public class StudentManager {
    // List to store students
    private List<Student> students = new List<Student>();

    // Method to add a student
    public void addStudent(String name, Integer age, String grade) {
        Student newStudent = new Student(name, age, grade);
        students.add(newStudent);
    }

    // Method to get student details by name
    public Student getStudentDetails(String name) {
        for (Student student : students) {
            if (student.name == name) {
                return student;
            }
        }
        return null;
    }

    // Inner class to represent a student
    private class Student {
        public String name;
        public Integer age;
        public String grade;

        public Student(String name, Integer age, String grade) {
            this.name = name;
            this.age = age;
            this.grade = grade;
        }
    }
}