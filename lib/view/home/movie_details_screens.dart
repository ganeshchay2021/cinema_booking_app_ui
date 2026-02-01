import 'package:cinema_booking_app_ui/constant/const.dart';
import 'package:cinema_booking_app_ui/model/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MovieDetailsScreens extends StatelessWidget {
  final Movie myMovie;
  const MovieDetailsScreens({super.key, required this.myMovie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBackgroundColor,

        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 300,
                    width: size.width * 0.61,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(myMovie.poster),
                      ),
                    ),
                  ),

                  Gap(20),

                  SizedBox(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myContainter(
                          iconName: "Camera",
                          text: myMovie.genre,
                          icon: Icons.videocam_rounded,
                        ),
                        myContainter(
                          iconName: "Duration",
                          text:
                              "${(myMovie.duration / 60).toInt()}h ${myMovie.duration % 60}m ",
                          icon: Icons.videocam_rounded,
                        ),
                        myContainter(
                          iconName: "Camera",
                          text: "Comedy",
                          icon: Icons.videocam_rounded,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Gap(20),

              Text(
                myMovie.title,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),

              Gap(20),
              Divider(color: grey, thickness: 2),
              Gap(20),
              Text(
                "Synopsis",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Gap(10),

              Text(
                myMovie.synopsis,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Container(
          height: 60,

          child: MaterialButton(
            color: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
            child: Center(
              child: Text(
                "Get Reservation",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container myContainter({
    required String iconName,
    required String text,
    required IconData icon,
  }) {
    return Container(
      height: 80,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          Text(iconName, style: TextStyle(color: Colors.grey)),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
