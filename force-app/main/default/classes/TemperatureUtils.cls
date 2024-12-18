public class TemperatureUtils {
    // Method to convert Celsius to Fahrenheit
    public static Double celsiusToFahrenheit(Double celsius) {
        return (celsius * 9/5) + 32;
    }
    
    // Method to convert Fahrenheit to Celsius
    public static Double fahrenheitToCelsius(Double fahrenheit) {
        return (fahrenheit - 32) * 5/9;
    }
    
    // Method to calculate average temperature from a list of readings
    public static Double calculateAverage(List<Double> temperatures) {
        if (temperatures == null || temperatures.isEmpty()) {
            throw new IllegalArgumentException('Temperature list cannot be null or empty.');
        }
        Double total = 0;
        for (Double temp : temperatures) {
            total += temp;
        }
        return total / temperatures.size();
    }
    
    // Example usage in an anonymous block:
    public static void exampleUsage() {
        Double celsius = 25.0;
        Double fahrenheit = celsiusToFahrenheit(celsius);
        System.debug('Celsius to Fahrenheit: ' + fahrenheit);

        fahrenheit = 77.0;
        celsius = fahrenheitToCelsius(fahrenheit);
        System.debug('Fahrenheit to Celsius: ' + celsius);

        List<Double> temps = new List<Double>{32.0, 45.0, 50.0, 60.0};
        Double average = calculateAverage(temps);
        System.debug('Average Temperature: ' + average);
    }
}