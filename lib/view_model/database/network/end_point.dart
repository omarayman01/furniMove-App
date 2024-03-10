class EndPoints {
  static const String baseUrl = 'https://www.googleapis.com/books/v1';
  static const String newestBooksEndpoint =
      '/volumes?Filtering=free-ebooks&q=subject:Computers&sorting=newest';
  static const String featuredBooksEndpoint =
      '/volumes?Filtering=free-ebooks&q=subject:Computer Science';
  static const String similarBooks =
      '/volumes?Filtering=free-ebooks&q=subject:programming';
}
