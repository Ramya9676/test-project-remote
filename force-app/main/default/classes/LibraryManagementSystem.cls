public class LibraryManagementSystem {
    // Inner class to represent a Book
    // modified for a commit template
    public class Book {
        public String title;
        public String author;
        public Boolean isAvailable;

        public Book(String title, String author) {
            this.title = title;
            this.author = author;
            this.isAvailable = true; // All books start as available
        }
    }

    // Map to store books with unique IDs
    private Map<Integer, Book> books = new Map<Integer, Book>();
    private Integer bookIdCounter = 1; // Counter for unique book IDs

    // Method to add a new book
    public void addBook(String title, String author) {
        Book newBook = new Book(title, author);
        books.put(bookIdCounter, newBook);
        System.debug('Added Book: ' + title + ' with ID: ' + bookIdCounter);
        bookIdCounter++;
    }

    // Method to borrow a book
    public String borrowBook(Integer bookId) {
        if (books.containsKey(bookId)) {
            Book book = books.get(bookId);
            if (book.isAvailable) {
                book.isAvailable = false;
                return 'You successfully borrowed: ' + book.title;
            } else {
                return 'Sorry, the book "' + book.title + '" is currently unavailable.';
            }
        } else {
            return 'Book ID not found.';
        }
    }

    // Method to return a book
    public String returnBook(Integer bookId) {
        if (books.containsKey(bookId)) {
            Book book = books.get(bookId);
            book.isAvailable = true;
            return 'Thank you for returning: ' + book.title;
        } else {
            return 'Book ID not found.';
        }
    }
	// second commit 
    // Method to list all books
    public String listBooks() {
        if (books.isEmpty()) {
            return 'No books available in the library.';
        }
        String bookList = 'Library Books:\n';
        for (Integer id : books.keySet()) {
            Book book = books.get(id);
            bookList += 'ID: ' + id + ', Title: ' + book.title + ', Author: ' + book.author + 
                        ', Available: ' + (book.isAvailable ? 'Yes' : 'No') + '\n';
        }
        return bookList;
    }
}