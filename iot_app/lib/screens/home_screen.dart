import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import '../widgets/custom_header.dart';
import 'package:iot_app/subscreens/subhome/data_screen.dart';
import 'package:iot_app/subscreens/subhome/next_screen.dart';
import 'package:iot_app/subscreens/subhome/on_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Encabezado
            const CustomHeader(title: 'Inicio'),

            Expanded(
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10),

                    //Botones
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ButtonsTabBar(
                          width: 105,
                          backgroundColor: Color.fromARGB(255, 138, 53, 87),
                          unselectedBackgroundColor: const Color.fromARGB(
                            255,
                            196,
                            174,
                            109,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),

                          tabs: const [
                            Tab(
                              icon: Icon(Icons.check_circle),
                              text: "Activos",
                            ),
                            Tab(icon: Icon(Icons.upcoming), text: "Próximos"),
                            Tab(icon: Icon(Icons.bar_chart), text: "Datos"),
                          ],
                        ),
                      ),
                    ),

                    // Pestañas
                    const Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          OnScreen(),
                          NextScreen(),
                          DataScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
