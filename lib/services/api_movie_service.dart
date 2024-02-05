import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiMovieService {
  final String baseUrl = "https://api.themoviedb.org/3/movie";
  final String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNWE4YTQ4NmZiMDY5ZmNiMTAzOTZhN2EzZTQ5Y2ViNCIsInN1YiI6IjVkMzAzZTI4Y2FhYjZkMTY0MGEwNjI5ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.apVYXOzq2PTk-rBQ6Zj-HKNwwGWVpke9XIL0-KXq_zw";
  final String lang = "fr-FR";

  final int page;

  const ApiMovieService({
    required this.page,
  });

  Future<Map<String,dynamic>?> getPopular() async{
    String completeUrl = "${baseUrl}/popular?language=${lang}&page=${page}";

    final response = await http.get(
      Uri.parse(completeUrl),
      headers: {
        "Authorization":"Bearer ${token}",
        "Content-Type":"application/json"
      }
    );

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    return null;
  }
}
