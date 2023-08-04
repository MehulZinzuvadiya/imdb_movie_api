import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imdb_movie_api/HomeScreen/View/home_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(
        name: '/',
        page: () => HomeScreen(),
      ),
    ],
  ));
}
