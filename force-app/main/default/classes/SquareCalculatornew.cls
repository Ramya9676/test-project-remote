public class SquareCalculatornew {
    // Method to calculate the square of two numbers
    public static List<Integer> calculateSquares(Integer number1, Integer number2) {
        Integer square1 = number1 * number1;
        Integer square2 = number2 * number2;

        List<Integer> results = new List<Integer>();
        results.add(square1);
        results.add(square2);

        return results;
    }
}