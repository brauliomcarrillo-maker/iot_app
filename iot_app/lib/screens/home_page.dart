import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:iot_app/screens/home_screen.dart';
import 'package:iot_app/screens/devices_screen.dart';
import 'package:iot_app/screens/calendar_screen.dart';
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
    DevicesScreen(),
    CalendarScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  final items = const [
    Icon(Icons.home, size: 30),
    Icon(Icons.air, size: 30),
    Icon(Icons.calendar_month, size: 30),
    Icon(Icons.question_mark, size: 30),
    Icon(Icons.person, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF952F57),

      child: SafeArea(
        top: false,

        child: Scaffold(
          backgroundColor: Colors.white,

          body: IndexedStack(index: index, children: screens),

          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(iconTheme: const IconThemeData(color: Colors.white)),

            child: CurvedNavigationBar(
              backgroundColor: Colors.white,
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
