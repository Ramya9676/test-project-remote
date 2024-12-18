public class First {
    
    // Method to convert liters to milliliters
    public static Decimal convertLitersToMilliliters(Decimal liters) {
        // Ensure the input is not null
        if(liters == null) {
            throw new IllegalArgumentException('Input cannot be null');
        }

        // Conversion logic: 1 liter = 1000 milliliters
        Decimal milliliters = liters * 1000;

        return milliliters;
    }
}