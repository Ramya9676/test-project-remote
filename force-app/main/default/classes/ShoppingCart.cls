public class ShoppingCart {
    // List to store items
    private List<Item> items = new List<Item>();

    // Method to add an item to the cart
    public void addItem(String name, Decimal price, Integer quantity) {
        Item newItem = new Item(name, price, quantity);
        items.add(newItem);
    }

    // Method to calculate the total price
    public Decimal calculateTotalPrice() {
        Decimal totalPrice = 0;
        for (Item item : items) {
            totalPrice += item.price * item.quantity;
        }
        return totalPrice;
    }

    // Inner class to represent an item
    private class Item {
        public String name;
        public Decimal price;
        public Integer quantity;

        public Item(String name, Decimal price, Integer quantity) {
            this.name = name;
            this.price = price;
            this.quantity = quantity;
        }
    }
}