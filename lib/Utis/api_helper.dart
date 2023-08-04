import 'dart:convert';

import 'package:http/http.dart' as http;

import '../HomeScreen/Model/movie_model.dart';

class ApiHelper {
  static final apihelper = ApiHelper._();

  ApiHelper._();

  Future<MovieModel> MovieApi() async {
    String apiLink =
        "https://moviesdatabase.p.rapidapi.com/titles/search/title/Game of Thrones";
    var response = await http.get(Uri.parse(apiLink));
    var json = jsonDecode(response.body);
    MovieModel moviemodel = MovieModel.fromJson(json);
    return moviemodel;
  }
}
