class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;

  Book(
      this.title,
      this.author,
      this.price, {
        this.isBorrowed = false,
      });
}

class Library {
  List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => book.isBorrowed == false).toList();
  }

  double getTotalValue() {
    return _books.fold(0, (total, book) => total + book.price);
  }
}

void main() {
  Library library = Library();

  library.addBook(Book("Harry Potter", "J.K. Rowling", 15.5));
  library.addBook(
    Book("The Hobbit", "J.R.R. Tolkien", 12.0, isBorrowed: true),
  );
  library.addBook(Book("1984", "George Orwell", 10.0));
  library.addBook(Book("Dune", "Frank Herbert", 20.0));

  print("Available books:");

  for (Book book in library.getAvailableBooks()) {
    print("${book.title} - ${book.author} - \$${book.price}");
  }

  print("\nTotal collection value: \$${library.getTotalValue()}");
}