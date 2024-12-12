public class Rectangle {
    // Method to calculate the area of a rectangle
    public static Double calculateArea(Double length, Double width) {
        if (length <= 0 || width <= 0) {
            throw new IllegalArgumentException('Length and width must be greater than zero.');
        }
        return length * width;
    }
}