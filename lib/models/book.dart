




class Book {

  final String title;
  final String image;
  final String detail;
  final String rating;
  final String genre;

  Book({
    required this.title,
    required this.detail,
    required this.genre,
    required this.image,
    required this.rating
});

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
        title: json['title'] ?? 'no-title',
        detail: json['detail'],
        genre: json['genre'],
        image: json['image'],
        rating: json['rating']
    );
  }

}
