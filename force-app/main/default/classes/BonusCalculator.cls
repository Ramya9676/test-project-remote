public class BonusCalculator {

    // Method to calculate bonus based on performance rating
    public static Decimal calculateBonus(String employeeName, Decimal salary, Integer performanceRating) {
        Decimal bonusPercentage;

        // Determine bonus percentage based on performance rating
        if (performanceRating >= 4 && performanceRating <= 5) {
            bonusPercentage = 0.1; // 10% bonus for excellent performance
        } else if (performanceRating == 3) {
            bonusPercentage = 0.05; // 5% bonus for satisfactory performance
        } else {
            bonusPercentage = 0; // No bonus for low performance
        }

        // Calculate bonus amount
        Decimal bonusAmount = salary * bonusPercentage;

        System.debug('Bonus calculated for ' + employeeName + ': $' + bonusAmount);
        return bonusAmount;
    }

    // Method to display employee details
    public static void displayEmployeeDetails(String employeeName, Decimal salary, Integer performanceRating) {
        System.debug('Employee Details:');
        System.debug('Name: ' + employeeName);
        System.debug('Salary: $' + salary);
        System.debug('Performance Rating: ' + performanceRating);
    }
}