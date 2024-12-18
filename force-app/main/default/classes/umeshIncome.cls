public class umeshIncome {
    // Attributes
    public Decimal salary;
    public Decimal bonuses;
    public Decimal deductions;

    // Constructor
    public umeshIncome(Decimal baseSalary, Decimal bonusAmount, Decimal deductionAmount) {
        salary = baseSalary;
        bonuses = bonusAmount;
        deductions = deductionAmount;
    }

    // Method to calculate net income
    public Decimal calculateNetIncome() {
        // Net income calculation: (Salary + Bonuses) - Deductions
        Decimal netIncome = (salary + bonuses) - deductions;
        return netIncome;
    }
}