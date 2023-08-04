import 'package:get/get.dart';
import 'package:imdb_movie_api/HomeScreen/Model/movie_model.dart';
import 'package:imdb_movie_api/Utis/api_helper.dart';

class HomeController extends GetxController {

  RxList movieList=[].obs;

  Future<MovieModel> getData() async {
    MovieModel m2 = await ApiHelper.apihelper.MovieApi();
    return m2;
  }
}
