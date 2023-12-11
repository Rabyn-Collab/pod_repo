



class Movie {

final String title;
final String overview;
final String poster_path;
final String vote_average;
final int id;

Movie({
  required this.title,
  required this.id,
  required this.overview,
  required this.poster_path,
  required this.vote_average
});


factory Movie.formJson(Map<String, dynamic> json){
  return Movie(
      title: json['title'],
      id: json['id'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      vote_average: json['vote_average'].toString()
  );
}

@override
  String toString() {
    return 'Movie('
        "title: ${this.title} "
        "id: ${this.id} "
        "overview: ${this.overview} "
        "poster_path: ${this.poster_path} "
        "vote_average: ${this.vote_average} "
    ')';
  }


}