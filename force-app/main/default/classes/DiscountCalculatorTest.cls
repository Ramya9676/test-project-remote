@isTest
private class DiscountCalculatorTest {
    @isTest
    static void testCalculateDiscount() {
        Decimal originalPrice = 200;
        Decimal discountPercentage = 20;

        Test.startTest();
        Decimal discountedPrice = DiscountCalculator.calculateDiscount(originalPrice, discountPercentage);
        Test.stopTest();
        
        System.assertEquals(160, discountedPrice, 'Discounted price should be calculated correctly.');
    }

    @isTest
    static void testInvalidDiscountCalculation() {
        try {
            Test.startTest();
            DiscountCalculator.calculateDiscount(200, -10);
            Test.stopTest();
            System.assert(false, 'Expected exception for negative discount.');
        } catch (IllegalArgumentException e) {
            System.assertEquals('Invalid input values.', e.getMessage(), 'Exception message should match.');
        }
    }
}