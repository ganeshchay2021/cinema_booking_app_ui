import 'dart:math';

import 'package:cinema_booking_app_ui/constant/const.dart';
import 'package:cinema_booking_app_ui/model/category_model.dart';
import 'package:cinema_booking_app_ui/model/movies_model.dart';
import 'package:cinema_booking_app_ui/view/home/movie_details_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController controller;
  double pageoffSet = 1;
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1, viewportFraction: 0.6)
      ..addListener(() {
        setState(() {
          pageoffSet = controller.page!;
        });
      });
  }

  void despose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: headerPart(),
      body: Column(
        children: [
          SizedBox(height: 20),

          searchBar(),

          SizedBox(height: 20),

          categoryMovie(),

          SizedBox(height: 40),

          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index % movies.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    double scale = max(
                      0.6,
                      (1 - (pageoffSet - index).abs() + 0.6),
                    );
                    double angle =
                        (controller.position.haveDimensions
                            ? index.toDouble() - (controller.page ?? 0)
                            : index.toDouble() - 1) *
                        5;
                    angle = angle.clamp(-5, 5);
                    final movie = movies[index % movies.length];

                    return GestureDetector(
                      onTap: () {
                        Get.to(MovieDetailsScreens(myMovie: movie,));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 100 - (scale / 1.6 * 100),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Transform.rotate(
                              angle: angle * pi / 90,
                              child: Hero(
                                tag: movie.poster,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    movie.poster,
                                    height: 300,
                                    width: 205,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 330,
                  child: Row(
                    children: List.generate(
                      movies.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 15),
                        width: currentIndex == index ? 30 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? buttonColor
                              : Colors.white24,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding categoryMovie() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.amber, fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward_ios, size: 15, color: Colors.amber),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(categories.length, (index) {
              final cate = categories[index];
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        cate.emoji,
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(cate.name, style: TextStyle(color: Colors.white)),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 40),
          Text(
            "Showing this months",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }

  //search bar area
  Padding searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade500, size: 28),
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(27),
          ),
          fillColor: grey,
          filled: true,
        ),
      ),
    );
  }

  //App Header Part
  AppBar headerPart() {
    return AppBar(
      backgroundColor: appBackgroundColor,
      actions: [
        SizedBox(width: 20),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Welcome Sara Arjun ",
                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
              ),
              TextSpan(text: "👋"),
              TextSpan(
                text: "\nLet's relax and watch a movie!",
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.amber.shade100, width: 1),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://in.bmscdn.com/iedb/artist/images/website/poster/large/sara-arjun-1055790-1764496804.jpg",
              ),
            ),
          ),
          height: 45,
          width: 45,
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
