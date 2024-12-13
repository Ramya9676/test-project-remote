public class XYZ {
// A method that returns a greeting message
    public String getGreeting(String name) {
        // Check if the name is null or empty
        if (String.isEmpty(name)) {
            return 'Hello, World!';
        }
        return 'Hello, ' + name + '!';
    }

    // A method that returns the sum of two numbers
    public Integer addNumbers(Integer num1, Integer num2) {
        return num1 + num2;
    }
}