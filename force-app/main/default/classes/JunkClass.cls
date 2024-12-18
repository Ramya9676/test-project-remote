public class JunkClass {
    public Integer someNumber;
    public String someString;

    // Constructor
    public JunkClass() {
        someNumber = 0;
        someString = 'Hello, World!';
    }

    // Method to set the number
    public void setNumber(Integer num) {
        someNumber = num;
    }

    // Method to get the number
    public Integer getNumber() {
        return someNumber;
    }

    // Method to set the string
    public void setString(String str) {
        someString = str;
    }

    // Method to get the string
    public String getString() {
        return someString;
    }

    // A method that does nothing useful
    public void doNothing() {
        System.debug('This method does nothing.');
    }
}