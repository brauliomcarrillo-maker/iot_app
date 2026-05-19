import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:iot_app/widgets/custom_header.dart';
import 'package:iot_app/subscreens/subdevices/h_building_devices.dart';
import 'package:iot_app/subscreens/subdevices/g_building_devices.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Encabezado
            const CustomHeader(title: 'Dispositivos'),

            Expanded(
              child: DefaultTabController(
                length: 2,
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
                          backgroundColor: const Color.fromARGB(255, 138, 53, 87),
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
                              icon: Icon(Icons.business),
                              text: "Edificio H",
                            ),
                            Tab(
                              icon: Icon(Icons.domain),
                              text: "Edificio G",
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Pestañas
                    const Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          HBuildingDevices(),
                          GBuildingDevices(),
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
