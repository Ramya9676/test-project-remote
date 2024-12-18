public class ExpenseTracker {
    // List to store expenses
    private List<Expense> expenses = new List<Expense>();

    // Method to add an expense
    public void addExpense(String description, Decimal amount) {
        Expense newExpense = new Expense(description, amount);
        expenses.add(newExpense);
    }

    // Method to calculate total expenses
    public Decimal calculateTotalExpenses() {
        Decimal total = 0;
        for (Expense expense : expenses) {
            total += expense.amount;
        }
        return total;
    }

    // Inner class to represent an expense
    private class Expense {
        public String description;
        public Decimal amount;

        public Expense(String description, Decimal amount) {
            this.description = description;
            this.amount = amount;
        }
    }
}