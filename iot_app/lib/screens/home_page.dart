import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:iot_app/screens/home_screen.dart';
import 'package:iot_app/screens/search_screen.dart';
import 'package:iot_app/screens/add_screen.dart';
import 'package:iot_app/screens/favorite_screen.dart';
import 'package:iot_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final screens = const [
    HomeScreen(),
    SearchScreen(),
    AddScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  final items = const [
    Icon(Icons.home, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.add, size: 30),
    Icon(Icons.favorite, size: 30),
    Icon(Icons.person, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF952F57),

      child: SafeArea(
        top: false,

        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 242, 242, 242),

          body: screens[index],

          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(
                color: Color.fromARGB(255, 242, 242, 242),
              ),
            ),

            child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: const Color(0xFF952F57),
              buttonBackgroundColor: const Color(0xFFC7A438),

              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 500),
              height: 60,
              items: items,
              index: index,
              onTap: (newIndex) {
                setState(() {
                  index = newIndex;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
