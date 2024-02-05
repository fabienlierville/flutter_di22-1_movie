import 'package:flutter/material.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/models/movie_info.dart';
import 'package:movie/repositories/movie_repository.dart';
import 'package:movie/services/api_movie_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des films"),
        actions: [IconButton(onPressed: getPopular, icon: Icon(Icons.refresh))],
      ),
    );
  }

  Future<void> getPopular() async {
    MovieInfo movieInfo = await MovieRepository(apiMovieService: ApiMovieService(page: 1))
        .getPopular();

    if(movieInfo.statusCode == 200){
      //Setstate qui refresh la liste des movies
      movieInfo.movies.forEach((movie) {
        print(movie.title);
      });
    }else{
      // faire un setstate pour afficher un
      // Widet d'erreur en rouge
      print(movieInfo.message);
    }

  }
}
