class BookListResponse {
  List<Book>? books;

  BookListResponse({
    this.books,
  });

  factory BookListResponse.fromJson(Map<String, dynamic> json) {
    return BookListResponse(
      books: json['books'] != null
          ? List<Book>.from(json['books'].map((x) => Book.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'books': books != null ? books!.map((x) => x.toJson()).toList() : null,
    };
  }
}

class Book {
  int? id;
  String? coverImageUrl;
  String? title;
  String? author;
  int? publishedYear;
  String? status;

  Book({
    this.id,
    this.coverImageUrl,
    this.title,
    this.author,
    this.publishedYear,
    this.status,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      coverImageUrl: json['coverImageUrl'],
      title: json['title'],
      author: json['author'],
      publishedYear: json['publishedYear'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'coverImageUrl': coverImageUrl,
      'title': title,
      'author': author,
      'publishedYear': publishedYear,
      'status': status,
    };
  }
}
