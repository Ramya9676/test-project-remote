public with sharing class OrderSummaryService {
    public static Map<Id, Decimal> getOrderSummaries() {
        Map<Id, Decimal> orderSummary = new Map<Id, Decimal>();

        List<Order> orders = [SELECT Id, (SELECT TotalPrice FROM OrderItems) FROM Order];
        for (Order ord : orders) {
            Decimal totalOrderValue = 0;
            for (OrderItem item : ord.OrderItems) {
                if (item.TotalPrice != null) {
                    totalOrderValue += item.TotalPrice;
                }
            }
            orderSummary.put(ord.Id, totalOrderValue);
        }
        
        return orderSummary;
    }
}