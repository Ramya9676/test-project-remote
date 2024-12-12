public class CalculationExample {

    public static void performCalculation() {
        // Example numbers
        Integer num1 = 10;
        Integer num2 = 5;
        
        // Addition
        Integer sum = num1 + num2;
        System.debug('Sum: ' + sum);
        
        // Subtraction
        Integer difference = num1 - num2;
        System.debug('Difference: ' + difference);
        
        // Multiplication
        Integer product = num1 * num2;
        System.debug('Product: ' + product);
        
        // Division
        if (num2 != 0) {
            Decimal quotient = (Decimal)num1 / num2;
            System.debug('Quotient: ' + quotient);
        } else {
            System.debug('Cannot divide by zero.');
        }
    }
}