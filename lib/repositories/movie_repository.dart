import 'package:movie/models/movie.dart';
import 'package:movie/services/api_movie_service.dart';

class MovieRepository {
  final ApiMovieService apiMovieService;

  const MovieRepository({
    required this.apiMovieService,
  });

  Future<List<Movie>?> getPopular() async {
    Map<String, dynamic>? json = await apiMovieService.getPopular();

    if(json == null){
      return null;
    }

    List<dynamic> results = json["results"];
    List<Movie> movies = [];
    results.forEach((jsonMovie) {
      movies.add(Movie.fromJson(jsonMovie));
    });
    return movies;
  }
}
