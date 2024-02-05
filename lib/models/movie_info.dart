
import 'package:movie/models/movie.dart';

class MovieInfo{
  List<Movie> movies;
  int pageActuelle;
  int pageTotale;
  String message;
  int statusCode;

  MovieInfo({
    required this.movies,
    required this.pageActuelle,
    required this.pageTotale,
    required this.message,
    required this.statusCode,
  });
}