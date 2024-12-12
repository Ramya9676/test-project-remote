public class ShapeCalculator {

    // Method to calculate the area of a circle
    public static Decimal calculateCircleArea(Decimal radius) {
        if (radius <= 0) {
            throw new IllegalArgumentException('Radius must be greater than 0');
        }
        return Math.PI * radius * radius; // Area = π * r^2
    }

    // Method to calculate the area of a rectangle
    public static Decimal calculateRectangleArea(Decimal length, Decimal width) {
        if (length <= 0 || width <= 0) {
            throw new IllegalArgumentException('Length and width must be greater than 0');
        }
        return length * width; // Area = length * width
    }

    // Method to calculate the area of a triangle
    public static Decimal calculateTriangleArea(Decimal base, Decimal height) {
        if (base <= 0 || height <= 0) {
            throw new IllegalArgumentException('Base and height must be greater than 0');
        }
        return (base * height) / 2; // Area = (base * height) / 2
    }
}