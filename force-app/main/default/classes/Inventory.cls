public class Inventory {
    // List to store products
    private List<Product> products = new List<Product>();

    // Method to add a product to the inventory
    public void addProduct(String name, Integer quantity) {
        Product newProduct = new Product(name, quantity);
        products.add(newProduct);
    }

    // Method to check stock level of a product
    public Integer checkStock(String name) {
        for (Product product : products) {
            if (product.name == name) {
                return product.quantity;
            }
        }
        return 0;
    }

    // Inner class to represent a product
    private class Product {
        public String name;
        public Integer quantity;

        public Product(String name, Integer quantity) {
            this.name = name;
            this.quantity = quantity;
        }
    }
}