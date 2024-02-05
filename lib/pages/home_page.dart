import 'package:flutter/material.dart';
import 'package:movie/models/movie.dart';
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
    List<Movie>? movies =
        await MovieRepository(apiMovieService: ApiMovieService(page: 1))
            .getPopular();
    movies?.forEach((movie) {

      print(movie.title);
    });
  }
}
