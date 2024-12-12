@isTest
private class FirstTest {

    // Test method to verify the liters to milliliters conversion
    @isTest
    static void testConvertLitersToMilliliters() {
        // Test with different values of liters
        Decimal liters1 = 2;
        Decimal expectedMilliliters1 = 2000;
        Decimal actualMilliliters1 = First.convertLitersToMilliliters(liters1);
        System.assertEquals(expectedMilliliters1, actualMilliliters1, 'Conversion from 2 liters should be 2000 milliliters');
        
        Decimal liters2 = 0.5;
        Decimal expectedMilliliters2 = 500;
        Decimal actualMilliliters2 = First.convertLitersToMilliliters(liters2);
        System.assertEquals(expectedMilliliters2, actualMilliliters2, 'Conversion from 0.5 liters should be 500 milliliters');
        
        Decimal liters3 = 1;
        Decimal expectedMilliliters3 = 1000;
        Decimal actualMilliliters3 = First.convertLitersToMilliliters(liters3);
        System.assertEquals(expectedMilliliters3, actualMilliliters3, 'Conversion from 1 liter should be 1000 milliliters');
    }

    // Test for null input (expecting an exception)
    @isTest
    static void testConvertLitersToMilliliters_withNullInput() {
        try {
            First.convertLitersToMilliliters(null);
            System.assert(false, 'Expected an exception when input is null');
        } catch (Exception e) {
            System.assertEquals('Input cannot be null', e.getMessage());
        }
    }
}