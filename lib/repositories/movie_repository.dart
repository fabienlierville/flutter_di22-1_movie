import 'package:movie/models/movie.dart';
import 'package:movie/models/movie_info.dart';
import 'package:movie/services/api_movie_service.dart';

class MovieRepository {
  final ApiMovieService apiMovieService;

  const MovieRepository({
    required this.apiMovieService,
  });

  Future<MovieInfo> getPopular() async {
    Map<String, dynamic> json = await apiMovieService.getPopular();

    if(json["statusCode"] != 200){
      return MovieInfo(
          movies: [],
          pageActuelle: 1,
          pageTotale: 1,
          message: json["body"]["status_message"],
          statusCode: json["statusCode"]
      );
    }

    List<dynamic> results = json["body"]["results"];
    List<Movie> movies = [];
    results.forEach((jsonMovie) {
      movies.add(Movie.fromJson(jsonMovie));
    });
    return MovieInfo(
        movies: movies,
        pageActuelle: 1,
        pageTotale: json["body"]["total_pages"],
        message: "Récupération OK",
        statusCode: json["statusCode"]
    );
  }
}
