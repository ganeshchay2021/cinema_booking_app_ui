import 'package:cinema_booking_app_ui/view/home/home_screen.dart';
import 'package:cinema_booking_app_ui/view/pages/compass_fill.dart';
import 'package:cinema_booking_app_ui/view/pages/profile.dart';
import 'package:cinema_booking_app_ui/view/pages/ticket_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottonNavBar extends StatefulWidget {
  const BottonNavBar({super.key});

  @override
  State<BottonNavBar> createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  final List<Widget> screens = const [
    HomeScreen(),
    CompassFill(),
    TicketScreen(),
    ProfileScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(
          shadows: [
            BoxShadow(color: Colors.white, spreadRadius: 80, blurRadius: 50),
          ],
        ),
        iconSize: 25,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.compass_fill),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ticket_fill),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: ""),
        ],
      ),
    );
  }
}
