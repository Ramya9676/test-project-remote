@isTest
private class OrderSummaryServiceTest {
    @testSetup
    static void setupTestData() {
        Order ord = new Order(Name = 'Test Order', Status = 'Draft', EffectiveDate = Date.today());
        insert ord;

        OrderItem item1 = new OrderItem(OrderId = ord.Id, PricebookEntryId = Test.getStandardPricebookId(), Quantity = 2, UnitPrice = 100);
        OrderItem item2 = new OrderItem(OrderId = ord.Id, PricebookEntryId = Test.getStandardPricebookId(), Quantity = 1, UnitPrice = 50);
        insert new List<OrderItem>{item1, item2};
    }

    @isTest
    static void testGetOrderSummaries() {
        Test.startTest();
        Map<Id, Decimal> orderSummaries = OrderSummaryService.getOrderSummaries();
        Test.stopTest();

        for (Id orderId : orderSummaries.keySet()) {
            System.assertEquals(250, orderSummaries.get(orderId), 'Order summary total should be 250.');
        }
    }
}