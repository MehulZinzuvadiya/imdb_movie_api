import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movies App💓'),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ],
        ),
        body: FutureBuilder(
          future: homeController.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              MovieModel? m1 = snapshot.data;
              return Obx(
                () => ListView.builder(
                  itemCount: m1!.results!.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${m1.results[index].titleText}'),
                    );
                  },
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
