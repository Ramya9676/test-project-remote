public class LengthConverter {
    
    // Conversion factors
    private static final Decimal METER_TO_KILOMETER = 0.001;
    private static final Decimal METER_TO_MILE = 0.000621371;
    private static final Decimal METER_TO_FEET = 3.28084;
    
    // Convert meters to kilometers
    public static Decimal metersToKilometers(Decimal meters) {
        return meters * METER_TO_KILOMETER;
    }
    
    // Convert meters to miles
    public static Decimal metersToMiles(Decimal meters) {
        return meters * METER_TO_MILE;
    }
    
    // Convert meters to feet
    public static Decimal metersToFeet(Decimal meters) {
        return meters * METER_TO_FEET;
    }
    
    // Convert kilometers to meters
    public static Decimal kilometersToMeters(Decimal kilometers) {
        return kilometers / METER_TO_KILOMETER;
    }
    
    // Convert miles to meters
    public static Decimal milesToMeters(Decimal miles) {
        return miles / METER_TO_MILE;
    }
    
    // Convert feet to meters
    public static Decimal feetToMeters(Decimal feet) {
        return feet / METER_TO_FEET;
    }
}