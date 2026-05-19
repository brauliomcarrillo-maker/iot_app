import 'package:flutter/material.dart';
import '../../services/home_assistant_service.dart';
import '../../models/ha_entity.dart';

class GBuildingDevices extends StatefulWidget {
  const GBuildingDevices({super.key});

  @override
  State<GBuildingDevices> createState() => _GBuildingDevicesState();
}

class _GBuildingDevicesState extends State<GBuildingDevices> {
  final HomeAssistantService _haService = HomeAssistantService();
  late Future<List<HAEntity>> _devicesFuture;

  @override
  void initState() {
    super.initState();
    _devicesFuture = _haService.getRelevantDevices(buildingFilter: 'G');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HAEntity>>(
      future: _devicesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Error: ${snapshot.error}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        final devices = snapshot.data ?? [];

        if (devices.isEmpty) {
          return ListWheelScrollView.useDelegate(
            itemExtent: 150,
            useMagnifier: true,
            magnification: 1.2,
            physics: const FixedExtentScrollPhysics(),
            diameterRatio: 2,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 1,
              builder: (context, index) {
                return _buildItem(
                  'Sin dispositivos encontrados', 
                  '-',
                  '',
                  Colors.grey.shade700,
                );
              },
            ),
          );
        }
        
        return ListWheelScrollView.useDelegate(
          itemExtent: 150,
          useMagnifier: true,
          magnification: 1.2,
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: 2,
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: devices.length,
            builder: (context, index) {
              final device = devices[index];
              final colors = [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple, Colors.teal];
              final color = colors[index % colors.length];
              
              return _buildItem(
                device.friendlyName, 
                device.state,
                device.entityId,
                color,
              );
            },
          ),
        );
      },
    );
  }

  static Widget _buildItem(String title, String state, String entityId, Color color) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Estado: $state',
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 4),
              Text(
                entityId,
                style: const TextStyle(fontSize: 12, color: Colors.white54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
