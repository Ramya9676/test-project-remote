public class Sample1 {
    public String name;
    
    // Constructor
    public Sample1(String name) {
        this.name = name;
    }
    
    // Method to get greeting
    public String getGreeting() {
        return 'Hello, ' + name;
    }
    
    // Method with error: Missing return type
    public void printGreeting() {
        System.debug('Greeting: ' + getGreeting());
    }
    
    
    // Method with error: Incorrect visibility modifier
    private void privateMethod() {
        System.debug('This method is private and cannot be accessed outside the class.');
    }
    
    // Method with error: Missing parameter in method call
    public void callMethodWithoutParameters() {
        privateMethod(); // Error: 'privateMethod' requires parameters but none were provided
    }
}