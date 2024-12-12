public class BankAcct {
    private integer balance=10;
    public string acctName;
    //Declare a public string attribute named accttype
    //Newcomment
    public string accttype;
    //Declare a method, named makeDeposit, that accepts an integer named deposit
    //Within the method, add the deposit amount to the balance
    //Dummy
    public void makeDeposit (integer deposit) {
    balance = balance + deposit;
    }
    //Declare a method, named getBalance, that returns an integer
    //New comment
    public integer getBalance() {
    //Return the balance attribute
    return balance;
    }
}