public class Topper {
    // Instance variables
    public String name;
    public Integer score;
    
    // Constructor to initialize the name and score
    public Topper(String studentName, Integer studentScore) {
        this.name = studentName;
        this.score = studentScore;
    }
    
    // Method to display topper details
    public String getTopperDetails() {
        return 'Topper: ' + name + ' with score: ' + score;
    }
}