public class schedZohoDeskData implements Schedulable  {
    public static void execute(SchedulableContext ctx) {
        ZohoDeskDepartments.getDepartmentsZohoDesk();
        ZohoDeskAccounts.getAccountsZohoDesk();
        ZohoDeskTickets.getTicketsZohoDesk();
    }

}