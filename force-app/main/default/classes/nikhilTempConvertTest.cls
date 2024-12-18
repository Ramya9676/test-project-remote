@isTest
public class nikhilTempConvertTest {
    
    @isTest
    static void testConvertFahrenheitToCelsius() {
        // Test case for converting 32°F to Celsius
        Double fahrenheit = 32.0;
        Double expectedCelsius = 0.0;
        Double actualCelsius = nikhilTempConvert.convertFahrenheitToCelsius(fahrenheit);
        
        // Assert that the conversion is correct
        System.assertEquals(expectedCelsius, actualCelsius, '32°F should be 0°C');
        
        // Test case for converting 98.6°F to Celsius
        fahrenheit = 98.6;
        expectedCelsius = 37.0;
        actualCelsius = nikhilTempConvert.convertFahrenheitToCelsius(fahrenheit);
        
        // Assert that the conversion is correct
        System.assertEquals(expectedCelsius, actualCelsius, '98.6°F should be 37°C');
    }
    
  
}