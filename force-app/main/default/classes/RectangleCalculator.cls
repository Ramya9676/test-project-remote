public class RectangleCalculator {
    // Properties of the rectangle
    public Double length { get; set; }
    public Double width { get; set; }

    // Constructor to initialize the rectangle
    public RectangleCalculator(Double length, Double width) {
        this.length = length;
        this.width = width;
    }

    // Method to calculate the area
    public Double calculateArea() {
        return length * width;
    }

    // Method to calculate the perimeter
    public Double calculatePerimeter() {
        return 2 * (length + width);
    }
}