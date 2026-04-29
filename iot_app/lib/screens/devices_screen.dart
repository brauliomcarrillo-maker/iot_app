import 'package:flutter/material.dart';
import 'package:iot_app/widgets/custom_header.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'Dispositivos'),

            //Lista de dispositivos
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 150,
                useMagnifier: true,
                magnification: 1.2,
                physics: const FixedExtentScrollPhysics(),
                diameterRatio: 2,
                children: [
                  _buildItem('Device 1', Colors.red),
                  _buildItem('Device 2', Colors.green),
                  _buildItem('Device 3', Colors.blue),
                  _buildItem('Device 4', Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildItem(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
