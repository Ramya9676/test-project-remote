public with sharing class DiscountCalculator {
    public static Decimal calculateDiscount(Decimal originalPrice, Decimal discountPercentage) {
        if (originalPrice == null || discountPercentage == null || originalPrice <= 0 || discountPercentage < 0) {
            throw new IllegalArgumentException('Invalid input values.');
        }
        
        return originalPrice - (originalPrice * discountPercentage / 100);
    }
}