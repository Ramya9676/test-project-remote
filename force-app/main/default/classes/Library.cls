public class Library {
    // List to store books
    private List<Book> books = new List<Book>();

    // Method to add a book to the library
    public void addBook(String title, String author, Boolean isAvailable) {
        Book newBook = new Book(title, author, isAvailable);
        books.add(newBook);
    }

    // Method to check if a book is available
    public Boolean isBookAvailable(String title) {
        for (Book book : books) {
            if (book.title == title) {
                return book.isAvailable;
            }
        }
        return false;
    }

    // Inner class to represent a book
    private class Book {
        public String title;
        public String author;
        public Boolean isAvailable;

        public Book(String title, String author, Boolean isAvailable) {
            this.title = title;
            this.author = author;
            this.isAvailable = isAvailable;
        }
    }
}