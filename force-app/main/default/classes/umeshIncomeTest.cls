@isTest
public class umeshIncomeTest {
    @isTest
    static void testCalculateNetIncome() {
        // Test case 1: Salary $60,000, Bonuses $5,000, Deductions $2,000
        umeshIncome income1 = new umeshIncome(60000.0, 5000.0, 2000.0);
        Decimal netIncome1 = income1.calculateNetIncome();
        System.assertEquals(63000.0, netIncome1, 'Net income should be $64,000');

        // Test case 2: Salary $80,000, Bonuses $8,000, Deductions $3,000
        umeshIncome income2 = new umeshIncome(80000.0, 8000.0, 3000.0);
        Decimal netIncome2 = income2.calculateNetIncome();
        System.assertEquals(85000.0, netIncome2, 'Net income should be $85,000');

        // Test case 3: Salary $50,000, Bonuses $3,000, Deductions $1,500
        umeshIncome income3 = new umeshIncome(50000.0, 3000.0, 1500.0);
        Decimal netIncome3 = income3.calculateNetIncome();
        System.assertEquals(51500.0, netIncome3, 'Net income should be $51,500');

        // Add more test cases as needed
    }
}