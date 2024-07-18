class Movie {
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;

  Movie({
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'No title',
      overview: json['overview'] ?? 'No overview',
      releaseDate: json['release_date'] ?? 'No release date',
      posterPath: json['poster_path'] ?? 'No poster path',
    );
  }
}
