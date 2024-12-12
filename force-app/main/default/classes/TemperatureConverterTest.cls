@isTest
public class TemperatureConverterTest {

    // Test method for converting Fahrenheit to Celsius
    @isTest
    public static void testFahrenheitToCelsius() {
        // Test data
        Double fahrenheit = 32.0;  // Freezing point of water
        Double expectedCelsius = 0.0;
        
        // Call the method
        Double result = TemperatureConverter.fahrenheitToCelsius(fahrenheit);
        
        // Assert that the result matches the expected Celsius value
        System.assertEquals(expectedCelsius, result, '32 Fahrenheit should be 0 Celsius');
    }

    // Test method for converting Celsius to Fahrenheit
    @isTest
    public static void testCelsiusToFahrenheit() {
        // Test data
        Double celsius = 100.0;  // Boiling point of water
        Double expectedFahrenheit = 212.0;
        
        // Call the method
        Double result = TemperatureConverter.celsiusToFahrenheit(celsius);
        
        // Assert that the result matches the expected Fahrenheit value
        System.assertEquals(expectedFahrenheit, result, '100 Celsius should be 212 Fahrenheit');
    }
}